/**
* This file is part of the nestk library.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
* Author: Nicolas Burrus <nicolas.burrus@uc3m.es>, (C) 2010
*/


#include <ntk/ntk.h>
#include <ntk/camera/calibration.h>
#include <ntk/geometry/pose_3d.h>
#include <ntk/numeric/levenberg_marquart_minimizer.h>
#include <opencv/cv.h>
#include <fstream>

#include <p3d/Camera/niKinect.h>

#include <QDir>
#include <QDebug>

using namespace ntk;
using namespace cv;

enum patternTypes { checkerBoard, circles };
enum imageTypes { IR, RGB };

struct ImageInfo 
{
	int type;
	std::string windowName;
	cv::Mat3b *image;
	cv::Mat3b *undistortedImage;
};

struct PatternInfo
{
	int pattren;
	int patternWidth;
	int patternHeight;
	float squareSize;
};

struct CalibrationInfo
{
//	std:: string oldCalibrationFile;
//	std::string newCalibrationFile;
	ImageInfo* imageInfo;
	PatternInfo* patternInfo;
	std::vector<Point2f>* rgbCorners;
	std::vector<Point2f>* irCorners;

	std::vector<Point2f>* undistortedRgbCorners;
	std::vector<Point2f>* undistortesIrCorners;

	cv::Mat1d depthIntrinsics;
	cv::Mat1d depthDistortion;

	cv::Mat1d rgbIntrinsics;
	cv::Mat1d rgbDistortion;

// stereo transform.
	cv::Mat1d R, T;
//	calibrationInfo() : rgbCorners(null), irCorners(null) {}
};

void calibrationPattern(std::vector<cv::Point3f> & output, PatternInfo *pinfo)
{
	const int numberOfCorners = pinfo->patternWidth * pinfo->patternHeight;


	output.resize(numberOfCorners);
	for(int j = 0; j < pinfo->patternHeight; ++j)
		for(int k = 0; k < pinfo->patternWidth; ++k)
	{
		output[j*pinfo->patternWidth+k] = Point3f(k*pinfo->squareSize, j*pinfo->squareSize, 0);
	}

}


//calibrate using opencv
bool calibrateRGBWithOpencv(CalibrationInfo &calibInfo, bool distorted = true) {
	std::cout<<"calibrating\n";
	Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);
	std::vector<Point2f> currentCorners;	
	cv::Mat scaledImage;
	if (distorted)
		scaledImage = calibInfo.imageInfo->image->clone();
	else
		scaledImage = calibInfo.imageInfo->undistortedImage->clone();

	int flags = CV_CALIB_CB_NORMALIZE_IMAGE+CV_CALIB_CB_ADAPTIVE_THRESH;
	bool ok = true;
	ok = findChessboardCorners(scaledImage, size, currentCorners, flags);
	std::cout<<"ok : "<<ok<<"\n";
	if (ok)
	{
		cv::Mat grayImage;
		cvtColor(scaledImage, grayImage, CV_BGR2GRAY);
		cornerSubPix(grayImage, currentCorners, Size(5,5), Size(-1,-1), cvTermCriteria( CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1 ));
	}
	cv::Mat drawImage = scaledImage;
	cv::Mat cornerMatrix(currentCorners.size(), 1, CV_32FC2);
	for (int row = 0; row <currentCorners.size(); ++row) {
		cornerMatrix.at<Point2f>(row,0) = currentCorners[row];
	}

	drawChessboardCorners(drawImage, size, cornerMatrix, ok);

	// imwrite(image_name + ".corners.png", drawImage);
	// if (!window_name.empty())
		//{
	imshow("dimg", drawImage);

		//}

	if (!ok)
	{
		currentCorners.clear();
		return false;
	}
	std::cout<<"ok was fine \n";
	if (distorted)
		calibInfo.rgbCorners = &currentCorners;
	else
		calibInfo.undistortedRgbCorners = &currentCorners;

	return true;
}

bool calibrateKinectRGB (CalibrationInfo &calibInfo)
{
	if (calibrateRGBWithOpencv(calibInfo, true))
	{
		std::cout<<"got back true \n";
		bool ok;
		std::vector<Point3f> patternPoints;
		calibrationPattern(patternPoints, calibInfo.patternInfo);
		const cv::Size imageSize(1280,1024);
		std::cout<<"image size set\n";
		std::vector<Mat> rvecs(calibInfo.rgbCorners->size()), tvecs(calibInfo.rgbCorners->size());
		std::cout<<"after calibrate vec \n";

		double error = calibrateCamera(patternPoints, *calibInfo.rgbCorners, imageSize, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion, rvecs, tvecs);
		std::cout<<"after calibrate camera \n";
		*calibInfo.imageInfo->undistortedImage = calibInfo.imageInfo->image->clone();
		undistort(*calibInfo.imageInfo->image, *calibInfo.imageInfo->undistortedImage, calibInfo.rgbIntrinsics, calibInfo.rgbDistortion);
		ok = calibrateRGBWithOpencv(calibInfo, false);

		if (ok)
		{
			cv::Mat1f H;
			estimate_checkerboard_pose(patternPoints,*calibInfo.undistortedRgbCorners,calibInfo.rgbIntrinsics,H);
			Pose3D pose;
			pose.setCameraParametersFromOpencv(calibInfo.rgbIntrinsics);
			ntk_dbg_print(pose, 1);
			pose.setCameraTransform(H);
			std::vector<Point2f> projectedCorners;
			foreach_idx(pattern_i, patternPoints)
			{
				ntk_dbg_print(patternPoints[pattern_i], 1);
				Point3f p = pose.projectToImage(patternPoints[pattern_i]);
				ntk_dbg_print(p, 1);
				projectedCorners[pattern_i] = Point2f(p.x, p.y);
			}
			cv::Mat drawImage = *calibInfo.imageInfo->undistortedImage;
			cv::Mat cornerMatrix(projectedCorners.size(), 1, CV_32FC2);
			for (int row = 0; row <projectedCorners.size(); ++row)
			{
				cornerMatrix.at<Point2f>(row,0) = projectedCorners[row];
			}
			Size size (calibInfo.patternInfo->patternWidth, calibInfo.patternInfo->patternHeight);

			drawChessboardCorners(drawImage, size, cornerMatrix, ok);
			calibInfo.undistortedRgbCorners = &projectedCorners;
			imshow(calibInfo.imageInfo->windowName, drawImage);
			return true;
		}
	}	
	return false;
}

void runTest(niKinect *kinect, const int numberOfImages)
{
	RGBDImage image1;
	bool ir = false;
	int count = 0;
	ImageInfo imageI;
	PatternInfo patternI;
	patternI.patternWidth = 8;
	patternI.patternHeight = 6;
	patternI.squareSize = 0.025;
	CalibrationInfo cInfo;
	cInfo.patternInfo = &patternI;
	kinect->getCamera()->start();
	std::cout<<"in runtest"<<count<<"\n";

	while(count < numberOfImages)
	{
		if (ir)
		{
			imageI.type = 0;
			imageI.windowName = "cornersIR";
			kinect->getCamera()->setIRMode(true);
			kinect->getCamera()->waitForNextFrame();
			kinect->getCamera()->copyImageTo(image1);
			kinect->getRGBDProcessor()->processImage(image1);
			cv::Mat1b debug_depth_img1 = normalize_toMat1b(image1.rawIntensity());
		//	imageI.image = &debug_depth_img1; 
			cInfo.imageInfo = &imageI;
			//	calibrateKinectIR(cInfo);
			
			++count;
			ir = false;
			imshow("ir", debug_depth_img1);
			cv::waitKey(10);	
		}
		else
		{
			imageI.type = 1;
			imageI.windowName = "cornersRGB";
			kinect->getCamera()->setIRMode(false);
			kinect->getCamera()->waitForNextFrame();
			kinect->getCamera()->copyImageTo(image1);
			kinect->getRGBDProcessor()->processImage(image1);
			cv::Mat3b debug_color_img1 = image1.rawRgb();
			imageI.image = &debug_color_img1; 
			cInfo.imageInfo = &imageI;
			//	calibrateKinectRGB(cInfo);
			
			++count;
			ir = true;
			imshow("color", debug_color_img1);
			cv::waitKey(10);
		}

}
kinect->getCamera()->stop();

}


int main()
{
	int numberOfImages = 50;
	niKinect kinect;
	std::cout<<"here\n";
	kinect.connectToCamera();
	runTest(&kinect,numberOfImages);
}
