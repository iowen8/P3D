#include "niKinect.h"

niKinect::niKinect() 
{
	camera = new OpenniGrabber(niDriver, 0);
	config = new niKinectConfiguration();
	rgbdProcessor = new OpenniRGBDProcessor();
	camera->setHighRgbResolution(true);
}

niKinect::niKinect(std::string configurationFile)
{
	config = new niKinectConfiguration();
	setConfigurationFile(configurationFile);
	config->readMyConfiguration();
	config->setCalibration(config->getCalibrationFile());
	camera = new OpenniGrabber(niDriver, config->getSerial());
	rgbdProcessor = new OpenniRGBDProcessor();
	camera->setHighRgbResolution(true);	
}

niKinect::niKinect(OpenniDriver* driver, int connectionId)
{
	camera = new OpenniGrabber(*driver, connectionId);
	rgbdProcessor = new OpenniRGBDProcessor();
	config = new niKinectConfiguration();
	camera->setHighRgbResolution(true);
}

niKinect::niKinect(std::string configurationFile, OpenniDriver* driver, int connectionId)
{
	config = new niKinectConfiguration();
	setConfigurationFile(configurationFile);
	config->readMyConfiguration();
	config->setCalibration(config->getCalibrationFile());
	camera = new OpenniGrabber(*driver, connectionId);
	rgbdProcessor = new OpenniRGBDProcessor();
	camera->setHighRgbResolution(true);
}



OpenniDriver niKinect::getOpenniDriver()
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
	return config->getConfigurationFile();
}

std::string niKinect::getCalibrationFile()
{
	return config->getCalibrationFile();
}

void niKinect::setOpenniDriver(OpenniDriver* driver)
{
	niDriver = *driver;
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
niKinectConfiguration* niKinect::getConfiguration()
{
	return config;
}

void niKinect::setConfigurationFile(std::string fileName)
{
	config->setConfigurationFile(fileName);
}

void niKinect::setCalibration(std::string fileName)
{
	config->setCalibration(fileName);
}
