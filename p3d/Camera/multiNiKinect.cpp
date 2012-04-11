#include "multiNiKinect.h"

multiNiKinect::multiNiKinect(vector<string> configurationFiles)
{
	numberOfCameras = configurationFiles.size();
	std::cout<<"number of cameras : "<<numberOfCameras<<std::endl;	
	configFiles.clear();
	cameras.clear();
	images.resize(numberOfCameras);
	for (int i =0; i<numberOfCameras; i++)
	{
		niKinect kinect(configurationFiles[i], &niDriver, i);
		addKinect(&kinect); 
	}
	std::cout <<"kinects created\n";
}
void multiNiKinect::addKinect(niKinect *kinect)
{
	kinect->setConfigurationFile(kinect->getConfigurationFile());
	kinect->getConfiguration()->readMyConfiguration();
	kinect->getCamera()->setHighRgbResolution(false);
	kinect->getCamera()->setCalibrationData(*kinect->getConfiguration()->getCalibration());
	kinect->getCamera()->connectToDevice();
	kinect->getCamera()->start();
	cameras.push_back(kinect);
	niKinectConfiguration *config = new niKinectConfiguration();
	

	config = kinect->getConfiguration();
	
	configFiles.push_back(*config);
	
}
void multiNiKinect::connectAndStartAll()
{
	std::cout <<"kinects connected\n";
	
}

OpenniDriver multiNiKinect::getNiDriver()
{
	return niDriver;
}

vector<niKinect*> multiNiKinect::getCameras()
{
	return cameras;
}

std::vector<RGBDImage*> multiNiKinect::getImages()
{
	std::cout <<"getting images\n";
	
	for (int i =0; i<cameras.size(); i++)
	{
	/*	cameras[i]->getCamera()->waitForNextFrame();
		cameras[i]->getCamera()->copyImageTo(*images[i]);
		cameras[i]->getRGBDProcessor()->processImage(*images[i]);*/	
	}
	return images;
}
