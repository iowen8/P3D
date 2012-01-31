#include <iostream>
#include "ntk/utils/xml_parser.h"
using namespace ntk;

int main()
{
	XMLNode camera = XMLNode::createXMLTopNode("Camera");
	camera.addAttribute("type","niKinect");

	XMLNode serial = camera.addChild("serial");
	serial.addAttribute("serial","908h98hf9a8hdf98dh");
	XMLNode calibration = camera.addChild("calibration");
	calibration.addAttribute("location","/data/config/calibration.yml");
	XMLNode offset = camera.addChild("offset");
	offset.addAttribute("x", "0.5");
	offset.addAttribute("y", "0.5");
	offset.addAttribute("z", "0.5");
	XMLNode rotation = camera.addChild("rotation");
	rotation.addAttribute("rotation", "0.5");
  	std::cout<< camera.writeToFile("../../data/config/test.xml");  
	
}