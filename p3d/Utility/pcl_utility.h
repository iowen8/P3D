#include <pcl/common/common.h>
#include <pcl/common/distances.h>
#include <pcl/common/eigen.h>
#include <pcl/point_types.h>

using namespace pcl;

struct RGB
{
	uint8_t r, g, b;
};

class pcl_utility
{
public:
	static float packRgb(RGB p);
	static RGB unpackRgb(float p);
};