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
include samples/CMakeFiles/synchronized-multiple-kinects.dir/depend.make

# Include the progress variables for this target.
include samples/CMakeFiles/synchronized-multiple-kinects.dir/progress.make

# Include the compile flags for this target's objects.
include samples/CMakeFiles/synchronized-multiple-kinects.dir/flags.make

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o: samples/CMakeFiles/synchronized-multiple-kinects.dir/flags.make
samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o: ../samples/synchronized_multiple_kinects.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o -c /Users/iowen8/nburrus-nestk-1bbac78/samples/synchronized_multiple_kinects.cpp

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/samples/synchronized_multiple_kinects.cpp > CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.i

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/samples/synchronized_multiple_kinects.cpp -o CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.s

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.requires:
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.requires

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.provides: samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.requires
	$(MAKE) -f samples/CMakeFiles/synchronized-multiple-kinects.dir/build.make samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.provides.build
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.provides

samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.provides.build: samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o

# Object files for target synchronized-multiple-kinects
synchronized__multiple__kinects_OBJECTS = \
"CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o"

# External object files for target synchronized-multiple-kinects
synchronized__multiple__kinects_EXTERNAL_OBJECTS =

bin/synchronized-multiple-kinects: samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o
bin/synchronized-multiple-kinects: lib/libnestk.a
bin/synchronized-multiple-kinects: lib/libglew.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_system-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_filesystem-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_thread-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_date_time-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_iostreams-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtOpenGL.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtSvg.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtGui.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtXml.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtNetwork.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtCore.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_system-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_filesystem-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_thread-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_date_time-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libboost_iostreams-mt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtOpenGL.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtSvg.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtGui.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtXml.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtNetwork.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libQtCore.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_common.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_octree.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkHybrid.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkParallel.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkRendering.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkGraphics.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkverdict.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkImaging.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkftgl.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkfreetype.a
bin/synchronized-multiple-kinects: /opt/local/lib/libXt.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libSM.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libICE.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libXext.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkIO.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkFiltering.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkDICOMParser.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkNetCDF_cxx.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkmetaio.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtksqlite.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkpng.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtktiff.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkzlib.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkjpeg.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkexpat.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libVPIC.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libCosmo.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkCommon.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtksys.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkexoIIc.a
bin/synchronized-multiple-kinects: /usr/local/lib/vtk-5.8/libvtkNetCDF.a
bin/synchronized-multiple-kinects: /usr/local/lib/libOpenNI.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_io.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_sample_consensus.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libflann_cpp_s.a
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_kdtree.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_search.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_filters.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_segmentation.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_range_image.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_visualization.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_features.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libqhullstatic.a
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_surface.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_registration.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_keypoints.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_tracking.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_apps.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_people.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libOpenNI.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_io.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_sample_consensus.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libflann_cpp_s.a
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_kdtree.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_search.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_filters.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_segmentation.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_range_image.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_visualization.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_features.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libqhullstatic.a
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_surface.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_registration.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_keypoints.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_tracking.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_apps.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_people.dylib
bin/synchronized-multiple-kinects: /usr/local/lib/libpcl_simulation.dylib
bin/synchronized-multiple-kinects: /opt/local/lib/libX11.dylib
bin/synchronized-multiple-kinects: lib/libOpenNI.dylib
bin/synchronized-multiple-kinects: lib/libusb.dylib
bin/synchronized-multiple-kinects: /usr/lib/libdl.dylib
bin/synchronized-multiple-kinects: lib/libTinyXml.a
bin/synchronized-multiple-kinects: samples/CMakeFiles/synchronized-multiple-kinects.dir/build.make
bin/synchronized-multiple-kinects: samples/CMakeFiles/synchronized-multiple-kinects.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/synchronized-multiple-kinects"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/synchronized-multiple-kinects.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/CMakeFiles/synchronized-multiple-kinects.dir/build: bin/synchronized-multiple-kinects
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/build

samples/CMakeFiles/synchronized-multiple-kinects.dir/requires: samples/CMakeFiles/synchronized-multiple-kinects.dir/synchronized_multiple_kinects.o.requires
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/requires

samples/CMakeFiles/synchronized-multiple-kinects.dir/clean:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/samples && $(CMAKE_COMMAND) -P CMakeFiles/synchronized-multiple-kinects.dir/cmake_clean.cmake
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/clean

samples/CMakeFiles/synchronized-multiple-kinects.dir/depend:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/iowen8/nburrus-nestk-1bbac78 /Users/iowen8/nburrus-nestk-1bbac78/samples /Users/iowen8/nburrus-nestk-1bbac78/build /Users/iowen8/nburrus-nestk-1bbac78/build/samples /Users/iowen8/nburrus-nestk-1bbac78/build/samples/CMakeFiles/synchronized-multiple-kinects.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/CMakeFiles/synchronized-multiple-kinects.dir/depend
