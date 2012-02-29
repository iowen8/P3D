#include <ntk/camera/freenect_grabber.h>

using namespace ntk;
using namespace cv;

int main(int argc, char** argv)
{
    FreenectGrabber grabber;
    grabber.connectToDevice();
    grabber.start();

    // Set camera tilt.
    grabber.setTiltAngle(10);
}
