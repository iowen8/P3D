/**
*
*/
#include "../Configuration/niKinectConfiguration.h"
#include <ntk/camera/openni_grabber.h>
#include <ntk/camera/rgbd_processor.h>

	using namespace ntk;

class niKinect
{   
public:
	niKinect();
	niKinect(std::string configurationFile);
	niKinect(OpenniDriver* driver, int connectionId);
	niKinect(std::string configurationFile, OpenniDriver* driver, int connectionId);
	
	~niKinect(){}

	virtual OpenniDriver getOpenniDriver();
	OpenniGrabber* getCamera();
	RGBDImage* getImage();
	OpenniRGBDProcessor* getRGBDProcessor();
	std::string getConfigurationFile();
	std::string getCalibrationFile();
	niKinectConfiguration* getConfiguration();
	

	

	virtual void setOpenniDriver(OpenniDriver* driver);
	void connectToCamera();
	void startCamera();
	void connectAndStart();
	void processImage();
	void nextImage();
	void setConfigurationFile(std::string fileName);
	void setCalibration(std::string fileName);

private: 
	int numberOfCameras;
	OpenniDriver niDriver;
	OpenniGrabber* camera;
	RGBDImage *image;
	OpenniRGBDProcessor *rgbdProcessor;
	niKinectConfiguration *config;
};
