/**
*
*/

#include <ntk/camera/openni_grabber.h>
#include <ntk/camera/rgbd_processor.h>

	using namespace ntk;

class niKinect
{   
public:
	niKinect();
	niKinect(OpenniDriver* driver, int connectionId);
	~niKinect(){}

	virtual OpenniDriver* getOpenniDriver();
	OpenniGrabber* getCamera();
	RGBDImage* getImage();
	OpenniRGBDProcessor* getRGBDProcessor();
	std::string getConfigurationFile();
	std::string getCalibrationFile();

	virtual void setOpenniDriver(OpenniDriver* driver);
	void connectToCamera();
	void startCamera();
	void connectAndStart();
	void processImage();
	void nextImage();
	void setConfigurationFile(std::string fileName);
	void setCalibrationFile(std::string fileName);

private: 
	int numberOfCameras;
	OpenniDriver* niDriver;
	OpenniGrabber* camera;
	RGBDImage *image;
	OpenniRGBDProcessor* rgbdProcessor;
	std::string configurationFile;
	std::string calibrationFile;

};
