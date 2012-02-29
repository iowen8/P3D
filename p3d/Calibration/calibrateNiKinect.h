#include <ntk/ntk.h>
#include <ntk/camera/calibration.h>
#include <ntk/geometry/pose_3d.h>
#include <ntk/numeric/levenberg_marquart_minimizer.h>
#include <opencv/cv.h>
#include <fstream>

#include "../Camera/niKinect.h"

using namespace ntk;
using namespace cv;

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

struct DepthCalibrationPoint
{
  DepthCalibrationPoint(double kinect_raw, double estimated)
    : kinect_raw(kinect_raw),
      estimated(estimated)
  {}
  double kinect_raw;
  double estimated;
};

struct CalibrationInfo
{
	std::string outputFile;
	ImageInfo* irImageInfo;
	ImageInfo* rgbImageInfo;
	ImageInfo* primaryImageInfo;
	ImageInfo* secondaryImageInfo;
	PatternInfo* patternInfo;
	
	std::vector<Point2f> rgbCorners;
	std::vector<Point2f> irCorners;

	std::vector<Point2f> undistortedRgbCorners;
	std::vector<Point2f> undistortedIrCorners;
	
	std::vector<DepthCalibrationPoint> depthValues;

	cv::Mat1d irIntrinsics;
	cv::Mat1d irDistortion;

	cv::Mat1d rgbIntrinsics;
	cv::Mat1d rgbDistortion;

// stereo transform.
	cv::Mat1d R, T;
	
	double depthOffset;
	double depthBaseline;
};

class calibrateNiKinect
{
public:
	static void buildCalibrationPattern(std::vector< std::vector<cv::Point3f> >& output, PatternInfo *pinfo, int size);
	static bool calibrateRGBWithOpencv(CalibrationInfo &calibInfo, bool distorted = true);
	static bool calibrateIRWithOpencv(CalibrationInfo &calibInfo, bool distorted = true);
	static bool calibrateKinectRGB (CalibrationInfo &calibInfo);
	static bool calibrateKinectIR(CalibrationInfo &calibInfo);
	static bool calibrateKinectStereo(CalibrationInfo &calibInfo);
	static void FindAndWriteMeans();
	static void calibrateRGBIR(niKinect *kinect, int numberOfPairs, std::string outputFile);
	static void calibrateMultiKinectRGB(niKinect *primaryKinect, niKinect *secondaryKinect, int numberOfPairs, std::string outputFile);
};