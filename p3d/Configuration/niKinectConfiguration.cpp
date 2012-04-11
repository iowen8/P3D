#include "niKinectConfiguration.h"

niKinectConfiguration::niKinectConfiguration()
{
	calibration = new RGBDCalibration();
}

niKinectConfiguration::~niKinectConfiguration()
{
	
}

void niKinectConfiguration::setSerial(std::string _serial)
{
	serial = _serial;
}

void niKinectConfiguration::setConfigurationFile(std::string fileName)
{
	configurationFile = fileName;
}

void niKinectConfiguration::setCalibration(std::string fileName)
{
	calibrationFile = fileName;
	//std::cout<<"calibraiton File name : "<<fileName<<"\n";
	calibration->loadFromFile(fileName.c_str());
	//std::cout<<"calibraiton loaded successfully File name : "<<fileName<<"\n";
}

bool niKinectConfiguration::save()
{
	XMLNode camera = XMLNode::createXMLTopNode("Camera");
	camera.addAttribute("type","niKinect");

	XMLNode kserial = camera.addChild("serial");
	kserial.addAttribute("serial",serial.c_str());
	XMLNode calibration = camera.addChild("calibration");
	calibration.addAttribute("location",calibrationFile.c_str());
	XMLNode offset = camera.addChild("offset");
	offset.addAttribute("x", "0.5");
	offset.addAttribute("y", "0.5");
	offset.addAttribute("z", "0.5");
	XMLNode rotation = camera.addChild("rotation");
	rotation.addAttribute("rotation", "0.5");
  	return camera.writeToFile(configurationFile.c_str());	
}

bool niKinectConfiguration::readConfiguration(std::string fileName)
{
	XMLNode camera, kserial, calibration;
	camera.parseFile(fileName.c_str());
	kserial = camera.getChildNode("serial");	
	calibration = camera.getChildNode("calibration");        
	
	serial = std::string(kserial.getAttribute("serial"));
	calibrationFile = std::string(calibration.getAttribute("location"));
	return true;
}

bool niKinectConfiguration::readMyConfiguration()
{
	XMLNode camera, kserial, calibration;
	camera = XMLNode::parseFile(configurationFile.c_str(), "Camera");
//	std::cout<<"parse file successfull\n";
	kserial = camera.getChildNode("serial");	
	calibration = camera.getChildNode("calibration");        
//	std::cout<<"serial and callibraiton retrieved sucessfully\n";
	
	serial = std::string(kserial.getAttribute("serial"));
	calibrationFile = std::string(calibration.getAttribute("location"));
	return true;
}

std::string niKinectConfiguration::getSerial()
{
	return serial;
}

std::string niKinectConfiguration::getConfigurationFile()
{
	return configurationFile;
}

std::string niKinectConfiguration::getCalibrationFile()
{
	return calibrationFile;
}

RGBDCalibration* niKinectConfiguration::getCalibration()
{
	return calibration;
}