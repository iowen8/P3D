#include <ntk/core.h>
#include <ntk/mesh/pcl_utils.h>
#include <p3d/Camera/niKinect.h>
#include <p3d/Registration/Align.h>
#include <pcl/common/common.h>
#include <pcl/common/distances.h>
#include <pcl/common/eigen.h>
#include <pcl/point_types.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/ndt.h>
#include <pcl/filters/approximate_voxel_grid.h>

using namespace ntk;

#include <stdint.h>

extern "C" {
	__inline__ uint64_t rdtsc(void) {
		uint32_t lo, hi;
		__asm__ __volatile__ (      // serialize
			"xorl %%eax,%%eax \n        cpuid"
			::: "%rax", "%rbx", "%rcx", "%rdx");
			/* We cannot use "=A", since this would use %rax on x86_64 and return only the lower 32bits of the TSC */
			__asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
			return (uint64_t)hi << 32 | lo;
		}
	}

	long getClock()
	{

		return rdtsc();
	}

	double frequency = 2.2 *  1E9;

	int main(int argc, char** argv)
	{   	 
		std::string pcdFile = std::string(argv[1]);
		std::string pcdFile2 = std::string(argv[2]);

		pcl::PointCloud<pcl::PointXYZ>::Ptr cloudP (new pcl::PointCloud<pcl::PointXYZ>());
		pcl::PointCloud<pcl::PointXYZ>::Ptr cloudS (new pcl::PointCloud<pcl::PointXYZ>());
		pcl::io::loadPCDFile (pcdFile, *cloudP);
		pcl::io::loadPCDFile (pcdFile2, *cloudS);
		pcl::PointCloud<pcl::PointXYZ>::Ptr cloudF (new pcl::PointCloud<pcl::PointXYZ>());
		pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
		
		icp.setInputCloud(cloudS);
		icp.setInputTarget(cloudP);
		long start = getClock();
		icp.setMaximumIterations (20);
		icp.setMaxCorrespondenceDistance (0.1);
		icp.align(*cloudF);
		long stop = getClock();

		std::cout<< "time to converge : "<<((stop - start)/frequency)<<"\n";
		pcl::visualization::CloudViewer viewer("Cloud Viewer");

		while(true)
		viewer.showCloud (cloudF, "icp_alignment");

	}
