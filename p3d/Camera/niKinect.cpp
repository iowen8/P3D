#include "niKinect.h"

niKinect::niKinect() 
{
	camera = new OpenniGrabber(*niDriver, 0);
	camera->setHighRgbResolution(true);
	
}

niKinect::niKinect(OpenniDriver* driver, int connectionId)
{
	camera = new OpenniGrabber(*driver, connectionId);
	camera->setHighRgbResolution(true);
	
}

OpenniDriver* niKinect::getOpenniDriver()
{
	return niDriver;
}

OpenniGrabber* niKinect::getCamera()
{
	return camera;
}


RGBDImage* niKinect::getImage()
{
	return image;
   
}

OpenniRGBDProcessor* niKinect::getRGBDProcessor()
{
	return rgbdProcessor;
}

std::string niKinect::getConfigurationFile()
{
	return configurationFile;
}

std::string niKinect::getCalibrationFile()
{
	return calibrationFile;
}

void niKinect::setOpenniDriver(OpenniDriver* driver)
{
	niDriver = driver;
}

void niKinect::connectToCamera()
{
	camera->connectToDevice();
} 

void niKinect::startCamera()
{
	camera->start();
}

void niKinect::connectAndStart()
{
	connectToCamera();
	startCamera();
}

void niKinect::processImage()
{
	rgbdProcessor->processImage(*image);
	
}

void niKinect::nextImage()
{
	
}

void niKinect::setConfigurationFile(std::string fileName)
{
	configurationFile = fileName;
}

void niKinect::setCalibrationFile(std::string fileName)
{
	calibrationFile = fileName;
}
