#include <p3d/Calibration/calibrateNiKinect.h>

int main(int argc, char** argv)
{
	int numberOfPairs = atoi(argv[1]);
	std::string outputFile = string(argv[2]);
	niKinect kinect;
	kinect.connectToCamera();
	calibrateNiKinect::calibrateRGBIR(&kinect,numberOfPairs, outputFile);
}
