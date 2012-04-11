#include <string>
#include <p3d/Camera/niKinect.h>
#include <ntk/core.h>
#include <ntk/utils/debug.h>

#include <ntk/camera/openni_grabber.h>
#include <ntk/camera/rgbd_processor.h>
#include <ntk/utils/opencv_utils.h>


std::string convertInt(int number)
{
	if (number == 0)
		return "0";
	std::string temp="";
	std::string returnvalue="";
	while (number>0)
	{
		temp+=number%10+48;
		number/=10;
	}
	for (int i=0;i<temp.length();i++)
		returnvalue+=temp[temp.length()-i-1];
	return returnvalue;
}

int main(int argc, char** argv)
{ 
	int numOfFrames = atoi(argv[1]);
	std::string k1 = std::string(argv[2]);
	std::string k2 = std::string(argv[3]);

	int count = 1;

	RGBDImage image1, image2;

	OpenniDriver ni_driver;

	niKinect kinect1(k1, &ni_driver, 0);
	niKinect kinect2(k2, &ni_driver, 1);

	kinect1.getCamera()->setHighRgbResolution(false);	
	kinect2.getCamera()->setHighRgbResolution(false);	

	kinect1.connectToCamera();
	kinect2.connectToCamera();

	kinect1.getCamera()->setCalibrationData(*kinect1.getConfiguration()->getCalibration());
	kinect2.getCamera()->setCalibrationData(*kinect2.getConfiguration()->getCalibration());

	kinect1.startCamera();
	kinect2.startCamera();

	std::string name1 = "cam1_frame_";
	std::string name2 = "cam2_frame_";
	std::string ext = ".png";

	while (count < numOfFrames)
	{
	// Wait for a new frame, get a local copy and postprocess it.
		kinect1.getCamera()->waitForNextFrame();

		kinect2.getCamera()->waitForNextFrame();

	//		std::cout<<"copying image\n";
		kinect1.getCamera()->copyImageTo(image1);
		kinect2.getCamera()->copyImageTo(image2);

		cv::Mat1b debug_depth_img1 = normalize_toMat1b(image1.depth());
		cv::Mat1b debug_depth_img2 = normalize_toMat1b(image2.depth());

		cv::Mat3b debug_color_img1 = image1.rawRgb();
		cv::Mat3b debug_color_img2 = image2.mappedRgb();

		imshow("depth1", debug_depth_img1);
		imshow("color1", debug_color_img1);

		imshow("depth2", debug_depth_img2);
		imshow("color2", debug_color_img2);

		std::string num = convertInt(count);
		std::string nm1d = "depth/"+name1+num+"_depth"+ext;
		std::string nm2d = "depth/"+name2+num+"_depth"+ext;
		std::string nm1rgb = "rgb/"+name1+num+"_color"+ext;
		std::string nm2rgb = "rgb/"+name2+num+"_color"+ext;

		IplImage img1 = (cv::Mat)debug_depth_img1;
		IplImage img2 = (cv::Mat)debug_depth_img2;
		IplImage img3 = (cv::Mat)debug_color_img1;
		IplImage img4 = (cv::Mat)debug_color_img2;

		cvSaveImage(nm1d.c_str(),&img1);
		cvSaveImage(nm2d.c_str(),&img2);
		cvSaveImage(nm1rgb.c_str(),&img3);
		cvSaveImage(nm2rgb.c_str(),&img4);

		++count;

		cv::waitKey(10);
	}
}