#include <string>
#include <vector>
#include "ntk/utils/xml_parser.h"
#include <ntk/camera/calibration.h>

using namespace ntk;

class niKinectConfiguration
{
public:
	niKinectConfiguration();
	~niKinectConfiguration();
	
	void setSerial(std::string _serial);
	void setConfigurationFile(std::string fileName);
	void setCalibration(std::string fileName);
	bool save();
	bool readConfiguration(std::string fileName);
	bool readMyConfiguration();

	std::string getSerial();
	std::string getConfigurationFile();
	std::string getCalibrationFile();
	RGBDCalibration* getCalibration();
	
private:
	std::string serial;
	std::string configurationFile;
	std::string calibrationFile;
	RGBDCalibration *calibration;
};