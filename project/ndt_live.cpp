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
		//get camera configs
		std::string primaryConfigFile = std::string(argv[1]);
		std::string secondaryConfigFile = std::string(argv[2]);
	    RGBDImage image1, image2;

		//connect to cameras
		OpenniDriver ni_driver;
		niKinect k1(primaryConfigFile, &ni_driver, 0);
		niKinect k2(secondaryConfigFile, &ni_driver, 1);

		//create point clouds to reference
		pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloudP (new pcl::PointCloud<pcl::PointXYZRGB>());
		pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloudS (new pcl::PointCloud<pcl::PointXYZRGB>());
		pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloudF (new pcl::PointCloud<pcl::PointXYZRGB>());


		//start cameras
		k1.getCamera()->setHighRgbResolution(false);	
		k2.getCamera()->setHighRgbResolution(false);	
		k1.connectToCamera();
		k2.connectToCamera();
		k1.getCamera()->setCalibrationData(*k1.getConfiguration()->getCalibration());
		k2.getCamera()->setCalibrationData(*k2.getConfiguration()->getCalibration());
		k1.startCamera();
		k2.startCamera();

		//init ndt
		// Initializing Normal Distributions Transform (NDT).
		pcl::NormalDistributionsTransform<pcl::PointXYZRGB, pcl::PointXYZRGB> ndt;

		// Setting max number of registration iterations.
		ndt.setMaximumIterations (35);

		//get first image to set calibration
		k1.getCamera()->waitForNextFrame();
		k1.getCamera()->copyImageTo(image1);
		k1.getRGBDProcessor()->processImage(image1);


		k2.getCamera()->waitForNextFrame();
		k2.getCamera()->copyImageTo(image2);
		k2.getRGBDProcessor()->processImage(image2);


		rgbdImageToPointCloudColor(*cloudP, image1);
		rgbdImageToPointCloudColor(*cloudS, image2);


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
		
		pcl::visualization::CloudViewer viewer("Cloud Viewer");

		while(true)
		{
			k1.getCamera()->waitForNextFrame();
			k1.getCamera()->copyImageTo(image1);
			k1.getRGBDProcessor()->processImage(image1);


			k2.getCamera()->waitForNextFrame();
			k2.getCamera()->copyImageTo(image2);
			k2.getRGBDProcessor()->processImage(image2);


			rgbdImageToPointCloudColor(*cloudP, image1);
			rgbdImageToPointCloudColor(*cloudS, image2);
			
			ndt.setInputCloud (cloudS);
			ndt.setInputTarget (cloudP);

			pcl::transformPointCloud (*cloudS, *cloudF, ndt.getFinalTransformation ());

			viewer.showCloud (cloudF, "primary");
			
		}
	}
