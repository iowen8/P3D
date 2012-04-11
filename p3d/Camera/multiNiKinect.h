#include "niKinect.h"
#include <ntk/camera/multiple_grabber.h>
#include <ntk/camera/rgbd_processor.h>
#include <vector>
#include <string>

using namespace ntk;
using namespace std;

class multiNiKinect 
{
public:
	multiNiKinect(vector<string> configs);
	~multiNiKinect(){}
	OpenniDriver getOpenniDriver();
	vector<niKinect*> getCameras();
	std::vector<RGBDImage*> getImages();
	
	void initializeCameras();
	void connectAndStartAll();
	void addKinect(niKinect *kinect);
	OpenniDriver getNiDriver();
	
	//void processImage(int imageId);
	//void processImages();
	//void nextImage();
	

private: 
	int numberOfCameras;
	OpenniDriver niDriver;
    vector<niKinect*> cameras;
    std::vector<RGBDImage*> images;
	std::vector<niKinectConfiguration> configFiles;
};