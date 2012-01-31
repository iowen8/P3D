#include "multiNiKinect.h"

multiNiKinect::multiNiKinect(int numberOfCams)
{
	numberOfCameras = numberOfCams;	
}

OpenniDriver* multiNiKinect::getOpenniDriver()
{
	return niDriver;
}

MultipleGrabber* multiNiKinect::getCameras()
{
	return cameras;
}

std::vector<RGBDImage>* multiNiKinect::getImages()
{
	return images;
}
