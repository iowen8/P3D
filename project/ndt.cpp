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
		pcl::visualization::CloudViewer viewer("Cloud Viewer");

		// Initializing Normal Distributions Transform (NDT).
		pcl::NormalDistributionsTransform<pcl::PointXYZ, pcl::PointXYZ> ndt;

		// Setting max number of registration iterations.
		ndt.setMaximumIterations (35);

		// Setting point cloud to be aligned.
		ndt.setInputCloud (cloudS);
		// Setting point cloud to be aligned to.
		ndt.setInputTarget (cloudP);
		long start = getClock();

		// Set initial alignment estimate found using robot odometry.
		Eigen::AngleAxisf init_rotation (0.6931, Eigen::Vector3f::UnitZ ());
		Eigen::Translation3f init_translation (1.79387, 0.720047, 0);
		Eigen::Matrix4f init_guess = (init_translation * init_rotation).matrix ();

		// Calculating required rigid transform to align the input cloud to the target cloud.
		ndt.align (*cloudF, init_guess);
		long stop = getClock();
		std::cout<< "time to converge : "<<((stop - start)/frequency)<<"\n";

		start = getClock();
		// Transforming unfiltered, input cloud using found transform.
		pcl::transformPointCloud (*cloudS, *cloudF, ndt.getFinalTransformation ());
		stop = getClock();
		std::cout<< "time to align originals: "<<((stop - start)/frequency)<<"\n";

		while(true)
		viewer.showCloud (cloudF, "primary");

	}
