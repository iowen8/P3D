#include "niKinect.h"
#include <ntk/camera/multiple_grabber.h>
#include <ntk/camera/rgbd_processor.h>

using namespace ntk;

class multiNiKinect : public niKinect
{
public:
	multiNiKinect(int numberOfCams);
	~multiNiKinect();
	
	virtual OpenniDriver getOpenniDriver();
	MultipleGrabber* getCameras();
	std::vector<RGBDImage>* getImages();
	
	void initializeCameras();
	void connectAndStartAll();
	virtual void  getOpenniDriver(OpenniDriver* driver);
	
	//void processImage(int imageId);
	//void processImages();
	void nextImage();
	

private: 
	int numberOfCameras;
	OpenniDriver niDriver;
    MultipleGrabber* cameras;
    std::vector<RGBDImage> *images;
};