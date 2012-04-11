#include "pcl_utility.h"

float pcl_utility::packRgb(RGB p)
{
	// pack r/g/b into rgb
	uint8_t r = 255, g = 0, b = 0;    // Example: Red color
	uint32_t rgb = ((uint32_t)p.r << 16 | (uint32_t)p.g << 8 | (uint32_t)p.b);
	return *reinterpret_cast<float*>(&rgb);
}

RGB pcl_utility::unpackRgb(flaot p)
{
	RGB c;
	// unpack rgb into r/g/b
	uint32_t rgb = *reinterpret_cast<int*>(&p);
	uint8_t c.r = (rgb >> 16) & 0x0000ff;
	uint8_t c.g = (rgb >> 8)  & 0x0000ff;
	uint8_t c.b = (rgb)       & 0x0000ff;

	return c;
}