#include <pcl/point_cloud.h>
#include <pcl/octree/octree.h>

class baseCoordinateSpace
{
public:
	baseCoordinateSpace();
	baseCoordinateSpace(pcl::PointCloud<pcl::PointXYZ>::Ptr inputCloud);
	baseCoordinateSpace(pcl::octree::OctreePointCloudSearch<pcl::PointXYZ> *inputOctree);
	~baseCoordinateSpace(){}
	
	void setPointCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr inputCloud);
	void setOctTree(pcl::octree::OctreePointCloudSearch<pcl::PointXYZ> *inputOctree);
	
	pcl::octree::OctreePointCloudSearch<pcl::PointXYZ> * getOctree();
	pcl::PointCloud<pcl::PointXYZ>::Ptr getPointCloud();
		
private:
	pcl::octree::OctreePointCloudSearch<pcl::PointXYZ> *octree;
	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud;
};