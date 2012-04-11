#include <p3d/Calibration/calibrateNiKinect.h>

int main(int argc, char** argv)
{
	int numberOfPairs = atoi(argv[1]);
	std::string configFile = string(argv[2]);
	niKinect kinect(configFile);
	calibrateNiKinect::calibrateRGBIR(&kinect,numberOfPairs);
}
