#include "calibrateNiKinect.h"

std::vector<CalibrationInfo> calibrations;

cv::Mat1f kinect_shift_ir_to_depth(cv::Mat3b& im)
{
	cv::Mat1f t (2, 3);
	t = 0.f;
	t(0,0) = 1;
	t(1,1) = 1;
	t(0,2) = -4.8;
	t(1,2) = -3.9;
	cv::Mat3b tmp;
	warpAffine(im, tmp, t, im.size());
	im = tmp;
	return im;//normalize_toMat1b(
}

struct DepthOffsetCostFunction : public ntk::CostFunction
{
	DepthOffsetCostFunction(const std::vector<DepthCalibrationPoint>& points)
		: CostFunction(2, points.size()), points(points)
		{}

	virtual void evaluate(const std::vector<double>& input, std::vector<double>& output) const
	{
		double b = input[0];
		double doff = input[1];
		foreach_idx(i, points)
		{
			double kd = points[i].kinect_raw;
			double z = 540.0 * 8.0 * b / (doff - kd);
			output[i] = 1000.0 * (z-points[i].estimated);
		}
	}

	const std::vector<DepthCalibrationPoint>& points;
};

double computeError(cv::Mat& F, std::vector<std::vector<Point2f> >& rgb_corners, std::vector<std::vector<Point2f> >& depth_corners)
{
	std::vector<cv::Point2f> points_in_rgb;
	for (int i = 0; i < rgb_corners.size(); ++i)
		for (int j = 0; j < rgb_corners[i].size(); ++j)
		points_in_rgb.push_back(rgb_corners[i][j]);

	std::vector<cv::Point2f> points_in_depth;
	for (int i = 0; i < depth_corners.size(); ++i)
		for (int j = 0; j < depth_corners[i].size(); ++j)
		points_in_depth.push_back(depth_corners[i][j]);

	std::vector<Vec3f> lines_in_depth;
	std::vector<Vec3f> lines_in_rgb;

	cv::computeCorrespondEpilines(cv::Mat(points_in_rgb), 1, F, lines_in_depth);
	cv::computeCorrespondEpilines(cv::Mat(points_in_depth), 2, F, lines_in_rgb);

	double avgErr = 0;
	for(int i = 0; i < points_in_rgb.size(); ++i)
	{
		double err = fabs(points_in_rgb[i].x*lines_in_rgb[i][0] +
			points_in_rgb[i].y*lines_in_rgb[i][1] + lines_in_rgb[i][2]);
		avgErr += err;
	}

	for(int i = 0; i < points_in_depth.size(); ++i)
	{
		double err = fabs(points_in_depth[i].x*lines_in_depth[i][0] +
			points_in_depth[i].y*lines_in_depth[i][1] + lines_in_depth[i][2]);
		avgErr += err;
	}

	return avgErr / (points_in_rgb.size() + points_in_depth.size());
}

// Taken from http://www.ros.org/wiki/kinect_calibration/technical
void estimateDepthFunction(CalibrationInfo &calibInfo)
{
	DepthOffsetCostFunction cost_f(calibInfo.depthValues);
	LevenbergMarquartMinimizer minimizer;
	std::vector<double> x (2);
	x[0] =  calibInfo.depthBaseline;
	x[1] = calibInfo.depthOffset;
	minimizer.minimize(cost_f, x);
	minimizer.diagnoseOutcome();
	calibInfo.depthBaseline = x[0];
	calibInfo.depthOffset = x[1];
//ntk_dbg_print(global::depth_baseline, 1);
//ntk_dbg_print(global::depth_offset, 1);
}

void calibrateNiKinect::writeData(CalibrationInfo &calibInfo)
{
	FileStorage output_file (calibInfo.outputFile,
		CV_STORAGE_WRITE);
	writeMatrix(output_file, "rgb_intrinsics", calibInfo.rgbIntrinsics);
	writeMatrix(output_file, "rgb_distortion", calibInfo.rgbDistortion);
	writeMatrix(output_file, "depth_intrinsics", calibInfo.irIntrinsics);
	writeMatrix(output_file, "depth_distortion", calibInfo.irDistortion);
	writeMatrix(output_file, "R", calibInfo.R);
	writeMatrix(output_file, "T", calibInfo.T);
	cv::Mat1i size_matrix(1,2);
	size_matrix(0,0) = 640;
	size_matrix(0,1) = 480;
	writeMatrix(output_file, "rgb_size", size_matrix);
	writeMatrix(output_file, "raw_rgb_size", size_matrix);
	writeMatrix(output_file, "depth_size", size_matrix);
	writeMatrix(output_file, "raw_depth_size", size_matrix);
	output_file.release();
}

void calibrateNiKinect::writeRTData(CalibrationInfo &rtInfo, niKinectConfiguration *cInfo)
{
	FileStorage output_file (cInfo->getCalibrationFile(),
		CV_STORAGE_WRITE);
	writeMatrix(output_file, "rgb_intrinsics", cInfo->getCalibration()->rgb_intrinsics);
	writeMatrix(output_file, "rgb_distortion", cInfo->getCalibration()->rgb_distortion);
	writeMatrix(output_file, "depth_intrinsics", cInfo->getCalibration()->depth_intrinsics);
	writeMatrix(output_file, "depth_distortion", cInfo->getCalibration()->depth_distortion);
	writeMatrix(output_file, "R", rtInfo.R);
	writeMatrix(output_file, "T", rtInfo.T);
	cv::Mat1i size_matrix(1,2);
	size_matrix(0,0) = 640;
	size_matrix(0,1) = 480;
	writeMatrix(output_file, "rgb_size", size_matrix);
	writeMatrix(output_file, "raw_rgb_size", size_matrix);
	writeMatrix(output_file, "depth_size", size_matrix);
	writeMatrix(output_file, "raw_depth_size", size_matrix);
	output_file.release();
}

void calibrateNiKinect::buildCalibrationPattern(std::vector< std::vector<cv::Point3f> >& output, PatternInfo *pinfo, int size)
{
	calibrationPattern(output,pinfo->patternWidth, pinfo->patternHeight, pinfo->squareSize ,size);
}

bool calibrateNiKinect::calibrateRGBWithOpencv(CalibrationInfo &calibInfo, bool distorted)
{
	Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);
	cv::Mat scaledImage;
	if (distorted)
		scaledImage = calibInfo.rgbImageInfo->image->clone();
	else
		scaledImage = calibInfo.rgbImageInfo->undistortedImage->clone();

	int flags = CV_CALIB_CB_NORMALIZE_IMAGE+CV_CALIB_CB_ADAPTIVE_THRESH;
	bool ok = true;
	if (distorted)
		ok = findChessboardCorners(scaledImage, size, calibInfo.rgbCorners, flags);
	else
		ok = findChessboardCorners(scaledImage, size, calibInfo.undistortedRgbCorners, flags);

	if (ok)
	{
		cv::Mat grayImage;
		cvtColor(scaledImage, grayImage, CV_BGR2GRAY);

		if (distorted)
		{
			cornerSubPix(grayImage, calibInfo.rgbCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		}
		else
		{
			cornerSubPix(grayImage, calibInfo.undistortedRgbCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		}

		return true;
	}

	if (distorted)
		calibInfo.rgbCorners.clear();
	else
		calibInfo.undistortedRgbCorners.clear();
	return false;
}

bool calibrateNiKinect::calibrateMultiRGBWithOpencv(CalibrationInfo &calibInfo, bool distorted)
{
	Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);
	cv::Mat primaryImage;
	cv::Mat secondaryImage;

if (distorted)
{
	primaryImage = calibInfo.primaryImageInfo->image->clone();
	secondaryImage = calibInfo.secondaryImageInfo->image->clone();
}
else 
{
	primaryImage = calibInfo.primaryImageInfo->undistortedImage->clone();
	secondaryImage = calibInfo.secondaryImageInfo->undistortedImage->clone();
}

	int flags = CV_CALIB_CB_NORMALIZE_IMAGE+CV_CALIB_CB_ADAPTIVE_THRESH;

	bool okPrimary = true, okSecondary = true;

if(distorted)
{
	okPrimary = findChessboardCorners(primaryImage, size, calibInfo.primaryCorners, flags);	
	okSecondary = findChessboardCorners(secondaryImage, size, calibInfo.secondaryCorners, flags);
	}
	else
	{
		okPrimary = findChessboardCorners(primaryImage, size, calibInfo.undistortedPrimaryCorners, flags);	
		okSecondary = findChessboardCorners(secondaryImage, size, calibInfo.undistortedSecondaryCorners, flags);
	}	

	if (okPrimary && okSecondary)
	{
	//	std::cout<<"both Ok\n";
		cv::Mat primaryGrayImage;
		cv::Mat secondaryGrayImage;
		cvtColor(primaryImage, primaryGrayImage, CV_BGR2GRAY);
		cvtColor(secondaryImage, secondaryGrayImage, CV_BGR2GRAY);
if(distorted)
{
		cornerSubPix(primaryGrayImage, calibInfo.primaryCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		cornerSubPix(secondaryGrayImage, calibInfo.secondaryCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
	}
	else
	{
		cornerSubPix(primaryGrayImage, calibInfo.undistortedPrimaryCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		cornerSubPix(secondaryGrayImage, calibInfo.undistortedSecondaryCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
	}
	//	imshow(calibInfo.primaryImageInfo->windowName, primaryImage);
	//	imshow(calibInfo.secondaryImageInfo->windowName, secondaryImage);
		return true;
	}

	calibInfo.primaryCorners.clear();
	calibInfo.secondaryCorners.clear();


	return false;
}

bool calibrateNiKinect::calibrateIRWithOpencv(CalibrationInfo &calibInfo, bool distorted)
{
//	std::cout<<"calibrating ir\n";
	Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);
	cv::Mat scaledImage;
	if (distorted)
		scaledImage = calibInfo.irImageInfo->image->clone();
	else
		scaledImage = calibInfo.irImageInfo->undistortedImage->clone();

	int flags = CV_CALIB_CB_NORMALIZE_IMAGE+CV_CALIB_CB_ADAPTIVE_THRESH;
	bool ok = true;
//	imshow("scaled",scaledImage);
	if (distorted)
		ok = findChessboardCorners(scaledImage, size, calibInfo.irCorners, flags);
	else
		ok = findChessboardCorners(scaledImage, size, calibInfo.undistortedIrCorners, flags);

	if (ok)
	{
		cv::Mat grayImage;
		cvtColor(scaledImage, grayImage, CV_BGR2GRAY);

		if (distorted)
		{
			//std::cout<<"found board dist\n";

			cornerSubPix(grayImage, calibInfo.irCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		}
		else
		{
		//	std::cout<<"found board u\n";

			cornerSubPix(grayImage, calibInfo.undistortedIrCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
		}

		return true;
	}

	if (distorted)
		calibInfo.irCorners.clear();
	else
		calibInfo.undistortedIrCorners.clear();
	return false;
}

bool calibrateNiKinect::calibrateKinectRGB (CalibrationInfo &calibInfo)
{	
	std::vector< std::vector<Point2f> > rgbCorners;
	rgbCorners.resize(1);
	if (calibrateRGBWithOpencv(calibInfo, true))
	{
		std::vector< std::vector<Point2f> > goodCorners;
		std::vector< std::vector<Point3f> > patternPoints;
		std::vector<cv::Mat> rvecs, tvecs;
		const cv::Size imageSize(640,480);
		int patternSize = calibInfo.patternInfo->patternWidth * calibInfo.patternInfo->patternHeight;
		goodCorners.push_back(calibInfo.rgbCorners);
		rgbCorners[0].resize(patternSize);

		buildCalibrationPattern(patternPoints, calibInfo.patternInfo, goodCorners.size());
		double error = calibrateCamera(patternPoints, goodCorners, imageSize, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion, rvecs, tvecs);
	//	std::cout<<"error is : "<<error<<std::endl;
		cv::Mat3b img = calibInfo.rgbImageInfo->image->clone();
		calibInfo.rgbImageInfo->undistortedImage = &img;
		undistort(*calibInfo.rgbImageInfo->image, *calibInfo.rgbImageInfo->undistortedImage, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion);

		if (calibrateRGBWithOpencv(calibInfo, false))
		{
			cv::Mat1f H;
			estimate_checkerboard_pose(patternPoints[0],calibInfo.undistortedRgbCorners,calibInfo.rgbIntrinsics,H);
			Pose3D pose;
			pose.setCameraParametersFromOpencv(calibInfo.rgbIntrinsics);

			//ntk_dbg_print(pose, 1);
			pose.setCameraTransform(H);

			foreach_idx(pattern_i, patternPoints[0])
			{
				ntk_dbg_print(patternPoints[0][pattern_i], 1);
				Point3f p = pose.projectToImage(patternPoints[0][pattern_i]);
				ntk_dbg_print(p, 1);
				rgbCorners[0][pattern_i] = Point2f(p.x, p.y);
			}

			cv::Mat drawImage = *calibInfo.rgbImageInfo->undistortedImage;
			cv::Mat cornerMatrix(rgbCorners[0].size(), 1, CV_32FC2);
			for (int row = 0; row <rgbCorners[0].size(); ++row)
			{
				cornerMatrix.at<Point2f>(row,0) = rgbCorners[0][row];
			}
			Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);

			bool ok = true;
			drawChessboardCorners(drawImage, size, cornerMatrix, ok);
			calibInfo.undistortedRgbCorners = rgbCorners[0];
			imshow(calibInfo.rgbImageInfo->windowName, drawImage);
			return true;
		}
	}	
	return false;
}

bool calibrateNiKinect::calibrateMultiKinectRGB (CalibrationInfo &calibInfo)
{	
	if (calibrateMultiRGBWithOpencv(calibInfo, true))
	{
		std::cout<<"got back true\n";	
		std::vector< std::vector<Point2f> > prgbCorners;
		prgbCorners.resize(1);
		std::vector< std::vector<Point2f> > srgbCorners;
		srgbCorners.resize(1);

		std::vector< std::vector<Point2f> > pgoodCorners;
		std::vector< std::vector<Point2f> > sgoodCorners;
		std::vector< std::vector<Point3f> > patternPoints;
		std::vector<cv::Mat> rvecs, tvecs;
		const cv::Size imageSize(640,480);
		int patternSize = calibInfo.patternInfo->patternWidth * calibInfo.patternInfo->patternHeight;
		pgoodCorners.push_back(calibInfo.primaryCorners);
		sgoodCorners.push_back(calibInfo.secondaryCorners);
		prgbCorners[0].resize(patternSize);
		srgbCorners[0].resize(patternSize);
		std::cout<<"got back true here\n";	

		buildCalibrationPattern(patternPoints, calibInfo.patternInfo, pgoodCorners.size());
		std::cout<<"ptrn built\n";	

		cv::Mat3b pimg = calibInfo.primaryImageInfo->image->clone();
		cv::Mat3b simg = calibInfo.secondaryImageInfo->image->clone();
		std::cout<<"images cloned\n";	
		
		calibInfo.primaryImageInfo->undistortedImage = &pimg;
		calibInfo.secondaryImageInfo->undistortedImage = &simg;
		std::cout<<"referenced for ud\n";	
		
		undistort(*calibInfo.primaryImageInfo->image, *calibInfo.primaryImageInfo->undistortedImage, calibInfo.primaryCalibration->rgb_intrinsics, calibInfo.primaryCalibration->rgb_distortion);
		undistort(*calibInfo.secondaryImageInfo->image, *calibInfo.secondaryImageInfo->undistortedImage, calibInfo.secondaryCalibration->rgb_intrinsics, calibInfo.secondaryCalibration->rgb_distortion);
		std::cout<<"got back true before again\n";	

		if (calibrateMultiRGBWithOpencv(calibInfo, false))
		{
			std::cout<<"got back true again\n";	
			
			cv::Mat1f Hp;
			cv::Mat1f Hs;
			estimate_checkerboard_pose(patternPoints[0],calibInfo.undistortedPrimaryCorners,calibInfo.primaryCalibration->rgb_intrinsics,Hp);
			estimate_checkerboard_pose(patternPoints[0],calibInfo.undistortedSecondaryCorners,calibInfo.secondaryCalibration->rgb_intrinsics,Hs);
			Pose3D posep;
			Pose3D poses;
			posep.setCameraParametersFromOpencv(calibInfo.primaryCalibration->rgb_intrinsics);
			poses.setCameraParametersFromOpencv(calibInfo.secondaryCalibration->rgb_intrinsics);

				//ntk_dbg_print(pose, 1);
			posep.setCameraTransform(Hp);
			poses.setCameraTransform(Hs);

			foreach_idx(pattern_i, patternPoints[0])
			{
				ntk_dbg_print(patternPoints[0][pattern_i], 1);
				Point3f pp = posep.projectToImage(patternPoints[0][pattern_i]);
				ntk_dbg_print(pp, 1);
				prgbCorners[0][pattern_i] = Point2f(pp.x, pp.y);
				Point3f ps = poses.projectToImage(patternPoints[0][pattern_i]);
				ntk_dbg_print(ps, 1);
				srgbCorners[0][pattern_i] = Point2f(ps.x, ps.y);
			}

			cv::Mat drawImagep = *calibInfo.primaryImageInfo->undistortedImage;
			cv::Mat drawImages = *calibInfo.secondaryImageInfo->undistortedImage;
			cv::Mat cornerMatrixp(prgbCorners[0].size(), 1, CV_32FC2);
			cv::Mat cornerMatrixs(srgbCorners[0].size(), 1, CV_32FC2);
			for (int row = 0; row <prgbCorners[0].size(); ++row)
			{
				cornerMatrixp.at<Point2f>(row,0) = prgbCorners[0][row];
				cornerMatrixs.at<Point2f>(row,0) = srgbCorners[0][row];
			}
			Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);

			bool ok = true;
			drawChessboardCorners(drawImagep, size, cornerMatrixp, ok);
			drawChessboardCorners(drawImages, size, cornerMatrixs, ok);
			calibInfo.undistortedPrimaryCorners = prgbCorners[0];
			calibInfo.undistortedSecondaryCorners = srgbCorners[0];
			imshow(calibInfo.primaryImageInfo->windowName, drawImagep);
			imshow(calibInfo.secondaryImageInfo->windowName, drawImages);
			return true;
		}
		return false;
	}	
	return false;
}


// Find depth intrinsics and return undistorted corners location
	bool calibrateNiKinect::calibrateKinectIR(CalibrationInfo &calibInfo)
	{
		std::vector< std::vector<Point2f> > irCorners;
		irCorners.resize(1);
		if (calibrateIRWithOpencv(calibInfo, true))
		{
			std::vector< std::vector<Point2f> > goodCorners;
			std::vector< std::vector<Point3f> > patternPoints;
			std::vector<cv::Mat> rvecs, tvecs;
			const cv::Size imageSize(640,480);
			int patternSize = calibInfo.patternInfo->patternWidth * calibInfo.patternInfo->patternHeight;
			goodCorners.push_back(calibInfo.irCorners);
			irCorners[0].resize(patternSize);

			buildCalibrationPattern(patternPoints, calibInfo.patternInfo, goodCorners.size());
			double error = calibrateCamera(patternPoints, goodCorners, imageSize, calibInfo.irIntrinsics, calibInfo.irDistortion, rvecs, tvecs);
	//	std::cout<<"error is : "<<error<<std::endl;
			cv::Mat3b img = calibInfo.irImageInfo->image->clone();
			calibInfo.irImageInfo->undistortedImage = &img;
			undistort(*calibInfo.irImageInfo->image, *calibInfo.irImageInfo->undistortedImage, calibInfo.irIntrinsics, calibInfo.irDistortion);

			if (calibrateIRWithOpencv(calibInfo, false))
			{
				cv::Mat1f H;
				estimate_checkerboard_pose(patternPoints[0],calibInfo.undistortedIrCorners,calibInfo.irIntrinsics,H);
				Pose3D pose;
				pose.setCameraParametersFromOpencv(calibInfo.irIntrinsics);

			//ntk_dbg_print(pose, 1);
				pose.setCameraTransform(H);

				foreach_idx(pattern_i, patternPoints[0])
				{
					ntk_dbg_print(patternPoints[0][pattern_i], 1);
					Point3f p = pose.projectToImage(patternPoints[0][pattern_i]);
					ntk_dbg_print(p, 1);
					irCorners[0][pattern_i] = Point2f(p.x, p.y);
				}

				cv::Mat drawImage = *calibInfo.irImageInfo->undistortedImage;
				cv::Mat cornerMatrix(irCorners[0].size(), 1, CV_32FC2);
				for (int row = 0; row <irCorners[0].size(); ++row)
				{
					cornerMatrix.at<Point2f>(row,0) = irCorners[0][row];
				}
				Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);

				bool ok = true;
				drawChessboardCorners(drawImage, size, cornerMatrix, ok);
				calibInfo.undistortedIrCorners = irCorners[0];
				imshow(calibInfo.irImageInfo->windowName, drawImage);
				return true;
			}
		}	
		return false;

	}

	bool calibrateNiKinect::calibrateKinectStereo(CalibrationInfo &calibInfo)
	{
		if (calibInfo.undistortedRgbCorners.size() == calibInfo.undistortedIrCorners.size())
		{		
			std::vector< std::vector<Point3f> > patternPoints;
			std::vector< std::vector<Point2f> >rgb;
			std::vector< std::vector<Point2f> >ir;

			buildCalibrationPattern(patternPoints, calibInfo.patternInfo, 1);

			cv::Mat E(3,3,CV_64F),F(3,3,CV_64F);
			cv::Mat zero_dist (calibInfo.irDistortion.size(), calibInfo.irDistortion.type());
			zero_dist = Scalar(0);
			const cv::Size imageSize(640,480);
			rgb.push_back(calibInfo.undistortedRgbCorners);
			ir.push_back(calibInfo.undistortedIrCorners);

			stereoCalibrate(patternPoints, rgb, ir, calibInfo.rgbIntrinsics, zero_dist,calibInfo.irIntrinsics, zero_dist, imageSize, calibInfo.R, calibInfo.T, E, F,
				TermCriteria(TermCriteria::COUNT+TermCriteria::EPS, 50, 1e-6),
				CALIB_FIX_INTRINSIC);

			double error = computeError(F,rgb, ir);

			if (error >= 1)
			{
				std::cout << "Average pixel reprojection error of : " << error <<" is too large" << std::endl;
				return false;
			}

			//calibrations.push_back(calibInfo);
			return true;
		}
		return false;
	}

	bool calibrateNiKinect::calibrateMultiKinectStereo(CalibrationInfo &calibInfo)
	{
		std::cout<<"here\n";
		if (calibInfo.primaryCorners.size() == calibInfo.secondaryCorners.size())
		{		

			std::vector< std::vector<Point3f> > patternPoints;
			std::vector< std::vector<Point2f> >primary;
			std::vector< std::vector<Point2f> >secondary;
		//std::cout<<"Before build calibration\n";

			buildCalibrationPattern(patternPoints, calibInfo.patternInfo, 1);
			primary.push_back(calibInfo.primaryCorners);
			secondary.push_back(calibInfo.secondaryCorners);

			cv::Mat E(3,3,CV_64F), F(3,3,CV_64F);
		//std::cout<<"Before zero dist\n";
			cv::Mat zero_dist (calibInfo.secondaryCalibration->depth_distortion.size(), calibInfo.secondaryCalibration->depth_distortion.type());
		//std::cout<<"after zero dist\n";

			zero_dist = Scalar(0);
			cv::Mat1d R, T;
		//std::cout<<"Before Stereo Calibrate\n";
			stereoCalibrate(patternPoints, primary,secondary, calibInfo.secondaryCalibration->rgb_intrinsics,zero_dist,calibInfo.secondaryCalibration->rgb_intrinsics, zero_dist, calibInfo.secondaryCalibration->rgbSize(), R, T, E, F,
				TermCriteria(TermCriteria::COUNT+TermCriteria::EPS, 50, 1e-6),
				CALIB_FIX_INTRINSIC);
		//std::cout<<"after Stereo Calibrate\n";

	// OpenCV coords has y down and z toward scene.
	// OpenGL classical 3d coords has y up and z backwards
	// This is the transform matrix.

			cv::Mat1d to_gl_base(3,3);
			setIdentity(to_gl_base);
			to_gl_base(1,1) = -1;
			to_gl_base(2,2) = -1;

			cv::Mat1d new_R = to_gl_base.inv() * R * to_gl_base;
			cv::Mat1d new_T = to_gl_base * (T);

			double error = computeError(F,primary, secondary);

	//	if (error >= 1)
	//	{
			std::cout << "Average pixel reprojection error of : " << error <<" is too large" << std::endl;
	//		return false;
	//	}

			calibInfo.secondaryCalibration->R = new_R;
			calibInfo.secondaryCalibration->T = new_T;
			calibInfo.secondaryCalibration->saveToFile(calibInfo.outputFile.c_str());

			return true;
		}
		return false;
	}

	void calibrateNiKinect::FindAndWriteRTMeans(niKinectConfiguration *calibInfo)
	{


	// stereo transform.
		cv::Mat1d R, T;

		for (int i=0; i<calibrations.size(); i++)
		{
			if (i == 0)
			{
			//initialize sums
				R = calibrations[i].R;
				T = calibrations[i].T;
			}
			else
			{
				R = R + calibrations[i].R;
				T = T + calibrations[i].T;
			}	
		}
		R = R / calibrations.size();
		T = T / calibrations.size();

		CalibrationInfo cInfo;
		cInfo.R = R;
		cInfo.T = T;
		writeRTData(cInfo, calibInfo);
	}

	void calibrateNiKinect::FindAndWriteMeans()
	{
		cv::Mat1d irIntrinsics;
		cv::Mat1d irDistortion;

		cv::Mat1d rgbIntrinsics;
		cv::Mat1d rgbDistortion;

	// stereo transform.
		cv::Mat1d R, T;

		for (int i=0; i<calibrations.size(); i++)
		{
			if (i == 0)
			{
			//initialize sums
				irIntrinsics = calibrations[i].irIntrinsics;
				irDistortion = calibrations[i].irDistortion;
				rgbIntrinsics = calibrations[i].rgbIntrinsics;
				rgbDistortion = calibrations[i].rgbDistortion;
				R = calibrations[i].R;
				T = calibrations[i].T;
			}
			else
			{
				irIntrinsics = irIntrinsics + calibrations[i].irIntrinsics;
				irDistortion = irDistortion + calibrations[i].irDistortion;
				rgbIntrinsics = rgbIntrinsics + calibrations[i].rgbIntrinsics;
				rgbDistortion = rgbDistortion + calibrations[i].rgbDistortion;
				R = R + calibrations[i].R;
				T = T + calibrations[i].T;
			}	
		}
		irIntrinsics = irIntrinsics / calibrations.size();
		irDistortion = irDistortion / calibrations.size();
		rgbIntrinsics = rgbIntrinsics / calibrations.size();
		rgbDistortion = rgbDistortion / calibrations.size();
		R = R / calibrations.size();
		T = T / calibrations.size();

		CalibrationInfo cInfo;
		cInfo.irIntrinsics = irIntrinsics;
		cInfo.irDistortion= irDistortion;
		cInfo.rgbIntrinsics = rgbIntrinsics;
		cInfo.rgbDistortion = rgbDistortion;
		cInfo.R = R;
		cInfo.T = T;
		cInfo.outputFile = calibrations[0].outputFile;	
		writeData(cInfo);
	}

	void calibrateNiKinect::calibrateRGBIR(niKinect *kinect, int numberOfPairs)
	{
		calibrations.clear();
		int count = 0;
		RGBDImage image;

		kinect->getCamera()->setHighRgbResolution(false);	
		kinect->connectToCamera();

		cv::Mat3b rgbImage;
		cv::Mat3b irImage;
		cv::Mat irS(480, 640, CV_32F);

		ImageInfo imageRgb, imageIr;

		imageIr.type = 0;
		imageIr.windowName = "cornersIR";
		imageIr.image = &irImage;

		imageRgb.type = 1;
		imageRgb.windowName = "cornersRGB";
		imageRgb.image = &rgbImage; 


		PatternInfo patternI;
		patternI.patternWidth = 8;
		patternI.patternHeight = 6;
		patternI.squareSize = 0.028;

		CalibrationInfo cInfo;
		cInfo.patternInfo = &patternI;
		cInfo.irImageInfo = &imageIr;
		cInfo.rgbImageInfo = &imageRgb;
		cInfo.depthOffset = 1090;
		cInfo.depthBaseline = 7.5e-02;
		cInfo.outputFile = kinect->getConfiguration()->getCalibrationFile();

		kinect->getCamera()->start();
		std::cout<<"calibrating\n";

		while(count < numberOfPairs)
		{
		//get RGB image
	//	std::cout<<"in while\n";
			kinect->getCamera()->setIRMode(false);
	//	std::cout<<"ir mode set\n";
			kinect->getCamera()->waitForNextFrame();
	//	std::cout<<"waititng for next frame\n";
			kinect->getCamera()->copyImageTo(image);
	//	std::cout<<"post processing\n";
			kinect->getRGBDProcessor()->processImage(image);
	//	std::cout<<"copying image\n";
			rgbImage = image.rawRgb();
	//	std::cout<<"rgb image recieved\n";

		//get IR image
			kinect->getCamera()->setIRMode(true);
			kinect->getCamera()->waitForNextFrame();
			kinect->getCamera()->copyImageTo(image);
			kinect->getRGBDProcessor()->processImage(image);
			cv::Mat orig = (cv::Mat)image.rawIntensity();
			cvResize( &static_cast<IplImage>(orig),  &static_cast<IplImage>(irS), CV_INTER_CUBIC);
			irImage = toMat3b(normalize_toMat1b(irS));
	//	std::cout<<"ir image recieved\n";
		//rgb
			if (calibrateKinectRGB(cInfo))
			{
			//ir
				if (calibrateKinectIR(cInfo))
				{
				//stereo
					if (calibrateKinectStereo(cInfo))
					{
						writeData(cInfo);
						count++;
						kinect->getCamera()->setCalibrationData(*kinect->getConfiguration()->getCalibration());
					}
				}
			}
			cv::waitKey(10);
		}
//	FindAndWriteMeans();
		kinect->getCamera()->stop();
	}

	void calibrateNiKinect::calibrateMultiKinect(niKinect *primaryKinect, niKinect *secondaryKinect, int numberOfPairs)
	{
		primaryKinect->getCamera()->setHighRgbResolution(false);	
		secondaryKinect->getCamera()->setHighRgbResolution(false);	

		primaryKinect->connectToCamera();
		secondaryKinect->connectToCamera();
		calibrations.clear();
		int count = 0;
		RGBDImage image1, image2;
		ImageInfo primary, secondary;
		cv::Mat3b primaryImage, secondaryImage;

		primary.type = 1;
		primary.windowName = "primaryRGB";
		primary.image = &primaryImage;

		secondary.type = 1;
		secondary.windowName = "secondaryRGB";
		secondary.image = &secondaryImage;

		PatternInfo patternI;
		patternI.patternWidth = 8;
		patternI.patternHeight = 6;
		patternI.squareSize = 0.028;

		CalibrationInfo cInfo;
		cInfo.patternInfo = &patternI;
		cInfo.primaryImageInfo = &primary;
		cInfo.secondaryImageInfo = &secondary;
		cInfo.primaryCalibration = primaryKinect->getConfiguration()->getCalibration();
		cInfo.secondaryCalibration = secondaryKinect->getConfiguration()->getCalibration();
		cInfo.outputFile = secondaryKinect->getConfiguration()->getCalibrationFile();


	//	primaryKinect->getCamera()->start();
	//	secondaryKinect->getCamera()->start();
	//	std::cout<<"waititng for next frame\n";
	//	primaryKinect->getCamera()->waitForNextFrame();
		primaryKinect->getCamera()->setCalibrationData(*primaryKinect->getConfiguration()->getCalibration());
	//	std::cout<<"waititng for next frame\n";
		
	//	secondaryKinect->getCamera()->waitForNextFrame();
		secondaryKinect->getCamera()->setCalibrationData(*secondaryKinect->getConfiguration()->getCalibration());

//	std::cout<<"calib Info set\n";

	//std::cout<<"rgb : "<primaryKinect->getConfiguration()->getCalibration()->rawRgbSize() <<"\n";
	//	std::cout<<"depth : "<<*primaryKinect->getConfiguration()->getCalibration()->rawDepthSize() <<"\n";

		primaryKinect->getCamera()->start();
		secondaryKinect->getCamera()->start();
		std::cout<<"calibrating\n";

		while(count < numberOfPairs)
		{	
			primaryKinect->getCamera()->waitForNextFrame();
			secondaryKinect->getCamera()->waitForNextFrame();

			primaryKinect->getCamera()->copyImageTo(image1);
			secondaryKinect->getCamera()->copyImageTo(image2);
			
			primaryKinect->getRGBDProcessor()->processImage(image1);
			secondaryKinect->getRGBDProcessor()->processImage(image2);

			primaryImage = image1.rawRgb();
			secondaryImage = image2.rawRgb();	

		//rgb
			if (calibrateMultiKinectRGB(cInfo))
		{
			std::cout<<"here\n";
			if (calibrateMultiKinectStereo(cInfo))
				std::cout<<"here2\n";
			
					count++;
			}
			cv::waitKey(10);
		}
//	FindAndWriteRTMeans(secondaryKinect->getConfiguration());
		primaryKinect->getCamera()->stop();
		secondaryKinect->getCamera()->stop();
	}
