#include <p3d/Calibration/calibrateNiKinect.h>

int main(int argc, char** argv)
{
	int numberOfPairs = atoi(argv[1]);
	std::string primaryConfigFile = std::string(argv[2]);
	std::string secondaryConfigFile = std::string(argv[3]);
	
    OpenniDriver ni_driver;
	niKinect primary(primaryConfigFile, &ni_driver, 0);
	niKinect secondary(secondaryConfigFile, &ni_driver, 1);

	calibrateNiKinect::calibrateMultiKinect(&primary, &secondary, numberOfPairs);
}
