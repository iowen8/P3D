# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /opt/local/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/iowen8/nburrus-nestk-1bbac78

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/iowen8/nburrus-nestk-1bbac78/build

# Include any dependencies generated for this target.
include samples/CMakeFiles/handpoint-tracking.dir/depend.make

# Include the progress variables for this target.
include samples/CMakeFiles/handpoint-tracking.dir/progress.make

# Include the compile flags for this target's objects.
include samples/CMakeFiles/handpoint-tracking.dir/flags.make

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o: samples/CMakeFiles/handpoint-tracking.dir/flags.make
samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o: ../samples/handpoint_tracking.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o -c /Users/iowen8/nburrus-nestk-1bbac78/samples/handpoint_tracking.cpp

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/handpoint-tracking.dir/handpoint_tracking.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/samples/handpoint_tracking.cpp > CMakeFiles/handpoint-tracking.dir/handpoint_tracking.i

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/handpoint-tracking.dir/handpoint_tracking.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/samples/handpoint_tracking.cpp -o CMakeFiles/handpoint-tracking.dir/handpoint_tracking.s

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.requires:
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.requires

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.provides: samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.requires
	$(MAKE) -f samples/CMakeFiles/handpoint-tracking.dir/build.make samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.provides.build
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.provides

samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.provides.build: samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o

# Object files for target handpoint-tracking
handpoint__tracking_OBJECTS = \
"CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o"

# External object files for target handpoint-tracking
handpoint__tracking_EXTERNAL_OBJECTS =

bin/handpoint-tracking: samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o
bin/handpoint-tracking: lib/libnestk.a
bin/handpoint-tracking: lib/libglew.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_system-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_filesystem-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_thread-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_date_time-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_iostreams-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libQtOpenGL.dylib
bin/handpoint-tracking: /opt/local/lib/libQtSvg.dylib
bin/handpoint-tracking: /opt/local/lib/libQtGui.dylib
bin/handpoint-tracking: /opt/local/lib/libQtXml.dylib
bin/handpoint-tracking: /opt/local/lib/libQtNetwork.dylib
bin/handpoint-tracking: /opt/local/lib/libQtCore.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_system-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_filesystem-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_thread-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_date_time-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libboost_iostreams-mt.dylib
bin/handpoint-tracking: /opt/local/lib/libQtOpenGL.dylib
bin/handpoint-tracking: /opt/local/lib/libQtSvg.dylib
bin/handpoint-tracking: /opt/local/lib/libQtGui.dylib
bin/handpoint-tracking: /opt/local/lib/libQtXml.dylib
bin/handpoint-tracking: /opt/local/lib/libQtNetwork.dylib
bin/handpoint-tracking: /opt/local/lib/libQtCore.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_common.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_octree.dylib
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkHybrid.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkParallel.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkRendering.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkGraphics.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkverdict.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkImaging.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkftgl.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkfreetype.a
bin/handpoint-tracking: /opt/local/lib/libXt.dylib
bin/handpoint-tracking: /opt/local/lib/libSM.dylib
bin/handpoint-tracking: /opt/local/lib/libICE.dylib
bin/handpoint-tracking: /opt/local/lib/libXext.dylib
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkIO.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkFiltering.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkDICOMParser.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkNetCDF_cxx.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkmetaio.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtksqlite.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkpng.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtktiff.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkzlib.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkjpeg.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkexpat.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libVPIC.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libCosmo.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkCommon.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtksys.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkexoIIc.a
bin/handpoint-tracking: /usr/local/lib/vtk-5.8/libvtkNetCDF.a
bin/handpoint-tracking: /usr/local/lib/libOpenNI.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_io.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_sample_consensus.dylib
bin/handpoint-tracking: /opt/local/lib/libflann_cpp_s.a
bin/handpoint-tracking: /usr/local/lib/libpcl_kdtree.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_search.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_filters.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_segmentation.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_range_image.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_visualization.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_features.dylib
bin/handpoint-tracking: /opt/local/lib/libqhullstatic.a
bin/handpoint-tracking: /usr/local/lib/libpcl_surface.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_registration.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_keypoints.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_tracking.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_apps.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_people.dylib
bin/handpoint-tracking: /usr/local/lib/libOpenNI.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_io.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_sample_consensus.dylib
bin/handpoint-tracking: /opt/local/lib/libflann_cpp_s.a
bin/handpoint-tracking: /usr/local/lib/libpcl_kdtree.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_search.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_filters.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_segmentation.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_range_image.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_visualization.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_features.dylib
bin/handpoint-tracking: /opt/local/lib/libqhullstatic.a
bin/handpoint-tracking: /usr/local/lib/libpcl_surface.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_registration.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_keypoints.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_tracking.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_apps.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_people.dylib
bin/handpoint-tracking: /usr/local/lib/libpcl_simulation.dylib
bin/handpoint-tracking: /opt/local/lib/libX11.dylib
bin/handpoint-tracking: lib/libOpenNI.dylib
bin/handpoint-tracking: lib/libusb.dylib
bin/handpoint-tracking: /usr/lib/libdl.dylib
bin/handpoint-tracking: lib/libTinyXml.a
bin/handpoint-tracking: samples/CMakeFiles/handpoint-tracking.dir/build.make
bin/handpoint-tracking: samples/CMakeFiles/handpoint-tracking.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/handpoint-tracking"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/handpoint-tracking.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/CMakeFiles/handpoint-tracking.dir/build: bin/handpoint-tracking
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/build

samples/CMakeFiles/handpoint-tracking.dir/requires: samples/CMakeFiles/handpoint-tracking.dir/handpoint_tracking.o.requires
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/requires

samples/CMakeFiles/handpoint-tracking.dir/clean:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && $(CMAKE_COMMAND) -P CMakeFiles/handpoint-tracking.dir/cmake_clean.cmake
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/clean

samples/CMakeFiles/handpoint-tracking.dir/depend:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/iowen8/nburrus-nestk-1bbac78 /Users/iowen8/nburrus-nestk-1bbac78/samples /Users/iowen8/nburrus-nestk-1bbac78/build /Users/iowen8/nburrus-nestk-1bbac78/build/samples /Users/iowen8/nburrus-nestk-1bbac78/build/samples/CMakeFiles/handpoint-tracking.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/CMakeFiles/handpoint-tracking.dir/depend
