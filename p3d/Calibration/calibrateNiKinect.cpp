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

void writeData(CalibrationInfo &calibInfo)
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
	size_matrix(0,0) = 1280;
	size_matrix(0,1) = 1024;
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
		bool ok;
		const cv::Size imageSize(1280,1024);
		int patternSize = calibInfo.patternInfo->patternWidth * calibInfo.patternInfo->patternHeight;
		goodCorners.push_back(calibInfo.rgbCorners);
		rgbCorners[0].resize(patternSize);

		buildCalibrationPattern(patternPoints, calibInfo.patternInfo, goodCorners.size());
		double error = calibrateCamera(patternPoints, goodCorners, imageSize, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion, rvecs, tvecs);
	//	std::cout<<"error is : "<<error<<std::endl;
		cv::Mat3b img = calibInfo.rgbImageInfo->image->clone();
		calibInfo.rgbImageInfo->undistortedImage = &img;
		undistort(*calibInfo.rgbImageInfo->image, *calibInfo.rgbImageInfo->undistortedImage, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion);

		ok = calibrateRGBWithOpencv(calibInfo, false);

		if (ok)
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

			drawChessboardCorners(drawImage, size, cornerMatrix, ok);
			calibInfo.undistortedRgbCorners = rgbCorners[0];
			imshow(calibInfo.rgbImageInfo->windowName, drawImage);
			return true;
		}
	}	
	return false;
}

// Find depth intrinsics and return undistorted corners location
bool calibrateNiKinect::calibrateKinectIR(CalibrationInfo &calibInfo)
{
	std::vector< std::vector<Point2f> > irCorners;
	irCorners.resize(1);
	cv::Mat3b img = calibInfo.irImageInfo->image->clone();
	Mat1f depth = kinect_shift_ir_to_depth(img);

	if (calibrateIRWithOpencv(calibInfo, true))
	{
		//std::cout<<"got back true\n";
		std::vector< std::vector<Point2f> > goodCorners;
		std::vector< std::vector<Point3f> > patternPoints;
		std::vector<cv::Mat> rvecs, tvecs;
		const cv::Size imageSize(1280,1024);
		int patternSize = calibInfo.patternInfo->patternWidth * calibInfo.patternInfo->patternHeight;
		goodCorners.push_back(calibInfo.irCorners);
		irCorners[0].resize(patternSize);
		bool ok;

		buildCalibrationPattern(patternPoints, calibInfo.patternInfo, goodCorners.size());
		double error = calibrateCamera(patternPoints, goodCorners, imageSize, calibInfo.irIntrinsics, calibInfo.irDistortion, rvecs, tvecs);
	//	std::cout<<"error is : "<<error<<std::endl;
		cv::Mat3b img2 = img.clone();
		calibInfo.irImageInfo->undistortedImage = &img2;
		undistort(*calibInfo.irImageInfo->image, *calibInfo.irImageInfo->undistortedImage, calibInfo.irIntrinsics, calibInfo.irDistortion);

		ok = calibrateIRWithOpencv(calibInfo, false);



		if (ok)
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
				double kinect_raw = depth(p.y, p.x);
				if (!(kinect_raw < 2047)) continue;
				ntk_dbg_print(kinect_raw, 1);
				double linear_depth = 1.0 / (kinect_raw * -0.0030711016 + 3.3309495161);
				const float k1 = 1.1863;
				const float k2 = 2842.5;
				const float k3 = 0.1236;
				double tan_depth = k3 * tanf(kinect_raw/k2 + k1);
				ntk_dbg_print(linear_depth, 1);
				ntk_dbg_print(tan_depth, 1);
				calibInfo.depthValues.push_back(DepthCalibrationPoint(kinect_raw, p.z));
			}

			cv::Mat drawImage = *calibInfo.irImageInfo->undistortedImage;
			cv::Mat cornerMatrix(irCorners[0].size(), 1, CV_32FC2);
			for (int row = 0; row <irCorners[0].size(); ++row)
			{
				cornerMatrix.at<Point2f>(row,0) = irCorners[0][row];
			}
			Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);

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
		const cv::Size imageSize(1280,1024);
		rgb.push_back(calibInfo.undistortedRgbCorners);
		ir.push_back(calibInfo.undistortedIrCorners);

		stereoCalibrate(patternPoints, rgb, ir, calibInfo.rgbIntrinsics, zero_dist,calibInfo.irIntrinsics, zero_dist, imageSize, calibInfo.R, calibInfo.T, E, F,
			TermCriteria(TermCriteria::COUNT+TermCriteria::EPS, 50, 1e-6),
			CALIB_FIX_INTRINSIC);

		double error = computeError(F,rgb, ir);
		
		if (error >= 1)
			std::cout << "Average pixel reprojection error of : " << error <<" is too large" << std::endl;
		calibrations.push_back(calibInfo);
		return true;
	}
	return false;
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

void calibrateNiKinect::calibrateRGBIR(niKinect *kinect, int numberOfPairs, std::string outputFile)
{
	calibrations.clear();
	int count = 0;
	RGBDImage image;

	cv::Mat3b rgbImage;
	cv::Mat3b irImage;

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
	cInfo.outputFile = outputFile;

	kinect->getCamera()->start();
	std::cout<<"calibrating\n";
	
	while(count < numberOfPairs)
	{
		//get RGB image
		kinect->getCamera()->setIRMode(false);
		kinect->getCamera()->waitForNextFrame();
		kinect->getCamera()->copyImageTo(image);
		kinect->getRGBDProcessor()->processImage(image);
		rgbImage = image.rawRgb();

		//get IR image
		kinect->getCamera()->setIRMode(true);
		kinect->getCamera()->waitForNextFrame();
		kinect->getCamera()->copyImageTo(image);
		kinect->getRGBDProcessor()->processImage(image);
		irImage = toMat3b(normalize_toMat1b(image.rawIntensity()));

		//rgb
		if (calibrateKinectRGB(cInfo))
		{
			//ir
			if (calibrateKinectIR(cInfo))
			{
				//stereo
				if (calibrateKinectStereo(cInfo))
					count++;
			}
		}
		cv::waitKey(10);
	}
	FindAndWriteMeans();
	kinect->getCamera()->stop();
}

void calibrateNiKinect::calibrateMultiKinectRGB(niKinect *primaryKinect, niKinect *secondaryKinect, int numberOfPairs, std::string outputFile)
{
	calibrations.clear();
	int count = 0;
	RGBDImage image;
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
	cInfo.outputFile = outputFile;
	
	primaryKinect->getCamera()->start();
	secondaryKinect->getCamera()->start();
	while(count < numberOfPairs)
	{	
		primaryKinect->getCamera()->waitForNextFrame();
		primaryKinect->getCamera()->copyImageTo(image);
		primaryKinect->getRGBDProcessor()->processImage(image);
		primaryImage = image.rawRgb();
		
		secondaryKinect->getCamera()->waitForNextFrame();
		secondaryKinect->getCamera()->copyImageTo(image);
		secondaryKinect->getRGBDProcessor()->processImage(image);
		secondaryImage = image.rawRgb();	
	}
}
