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
include deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/depend.make

# Include the progress variables for this target.
include deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/progress.make

# Include the compile flags for this target's objects.
include deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o: ../deps/openni/Source/Modules/nimRecorder/ExportedPlayer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedPlayer.cpp

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedPlayer.cpp > CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.i

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedPlayer.cpp -o CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.s

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.requires:
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.provides: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.requires
	$(MAKE) -f deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.provides.build
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.provides

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.provides.build: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o: ../deps/openni/Source/Modules/nimRecorder/ExportedRecorder.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedRecorder.cpp

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedRecorder.cpp > CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.i

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/ExportedRecorder.cpp -o CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.s

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.requires:
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.provides: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.requires
	$(MAKE) -f deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.provides.build
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.provides

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.provides.build: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o: ../deps/openni/Source/Modules/nimRecorder/nimRecorder.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/nimRecorder.cpp

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nimRecorder.dir/nimRecorder.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/nimRecorder.cpp > CMakeFiles/nimRecorder.dir/nimRecorder.cpp.i

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nimRecorder.dir/nimRecorder.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/nimRecorder.cpp -o CMakeFiles/nimRecorder.dir/nimRecorder.cpp.s

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.requires:
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.provides: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.requires
	$(MAKE) -f deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.provides.build
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.provides

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.provides.build: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o: ../deps/openni/Source/Modules/nimRecorder/PlayerNode.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/PlayerNode.cpp

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nimRecorder.dir/PlayerNode.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/PlayerNode.cpp > CMakeFiles/nimRecorder.dir/PlayerNode.cpp.i

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nimRecorder.dir/PlayerNode.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/PlayerNode.cpp -o CMakeFiles/nimRecorder.dir/PlayerNode.cpp.s

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.requires:
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.provides: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.requires
	$(MAKE) -f deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.provides.build
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.provides

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.provides.build: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/flags.make
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o: ../deps/openni/Source/Modules/nimRecorder/RecorderNode.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/RecorderNode.cpp

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nimRecorder.dir/RecorderNode.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/RecorderNode.cpp > CMakeFiles/nimRecorder.dir/RecorderNode.cpp.i

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nimRecorder.dir/RecorderNode.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder/RecorderNode.cpp -o CMakeFiles/nimRecorder.dir/RecorderNode.cpp.s

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.requires:
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.provides: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.requires
	$(MAKE) -f deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.provides.build
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.provides

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.provides.build: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o

# Object files for target nimRecorder
nimRecorder_OBJECTS = \
"CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o" \
"CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o" \
"CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o" \
"CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o" \
"CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o"

# External object files for target nimRecorder
nimRecorder_EXTERNAL_OBJECTS =

lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o
lib/libnimRecorder.dylib: lib/libOpenNI.dylib
lib/libnimRecorder.dylib: lib/libnimCommon.dylib
lib/libnimRecorder.dylib: lib/libOpenNI.dylib
lib/libnimRecorder.dylib: lib/libusb.dylib
lib/libnimRecorder.dylib: /usr/lib/libdl.dylib
lib/libnimRecorder.dylib: lib/libTinyXml.a
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build.make
lib/libnimRecorder.dylib: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library ../../../../../lib/libnimRecorder.dylib"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nimRecorder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build: lib/libnimRecorder.dylib
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/build

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedPlayer.cpp.o.requires
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/ExportedRecorder.cpp.o.requires
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/nimRecorder.cpp.o.requires
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/PlayerNode.cpp.o.requires
deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires: deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/RecorderNode.cpp.o.requires
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/requires

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/clean:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder && $(CMAKE_COMMAND) -P CMakeFiles/nimRecorder.dir/cmake_clean.cmake
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/clean

deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/depend:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/iowen8/nburrus-nestk-1bbac78 /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Source/Modules/nimRecorder /Users/iowen8/nburrus-nestk-1bbac78/build /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/openni/Source/Modules/nimRecorder/CMakeFiles/nimRecorder.dir/depend

