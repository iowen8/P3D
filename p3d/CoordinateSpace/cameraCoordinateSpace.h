#include "baseCoordinateSpace.h"
#include <Eigen/Dense>
#include <Eigen/Geometry> 



class cameraCoordinateSpace : public baseCoordinateSpace
{
	cameraCoordinateSpace();
	~cameraCoordinateSpace(){}
	Eigen::Vector3f getOffset();
	Eigen::Quaternion<float> getRotation();
	baseCoordinateSpace getWorldSpace();
	
	void setOffset(Eigen::Vector3f inputOffset);
	void setRotation(Eigen::Quaternion<float> rotation);
	void setWorldSpace(baseCoordinateSpace inputWorld);
private:
	baseCoordinateSpace *world;
	Eigen::Vector3f offset;
	Eigen::Quaternion<float> rotation;
};