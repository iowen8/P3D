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
include deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/depend.make

# Include the progress variables for this target.
include deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/progress.make

# Include the compile flags for this target's objects.
include deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/flags.make

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/flags.make
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o: ../deps/openni/Nite/Samples/Players/kbhit.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Sample-Players.dir/kbhit.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/kbhit.cpp

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Sample-Players.dir/kbhit.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/kbhit.cpp > CMakeFiles/Sample-Players.dir/kbhit.cpp.i

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Sample-Players.dir/kbhit.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/kbhit.cpp -o CMakeFiles/Sample-Players.dir/kbhit.cpp.s

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.requires:
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.requires

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.provides: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.requires
	$(MAKE) -f deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build.make deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.provides.build
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.provides

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.provides.build: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/flags.make
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o: ../deps/openni/Nite/Samples/Players/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Sample-Players.dir/main.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/main.cpp

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Sample-Players.dir/main.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/main.cpp > CMakeFiles/Sample-Players.dir/main.cpp.i

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Sample-Players.dir/main.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/main.cpp -o CMakeFiles/Sample-Players.dir/main.cpp.s

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.requires:
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.requires

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.provides: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.requires
	$(MAKE) -f deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build.make deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.provides.build
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.provides

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.provides.build: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/flags.make
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o: ../deps/openni/Nite/Samples/Players/SceneDrawer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/SceneDrawer.cpp

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/SceneDrawer.cpp > CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.i

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/SceneDrawer.cpp -o CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.s

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.requires:
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.requires

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.provides: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.requires
	$(MAKE) -f deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build.make deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.provides.build
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.provides

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.provides.build: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/flags.make
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o: ../deps/openni/Nite/Samples/Players/signal_catch.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/iowen8/nburrus-nestk-1bbac78/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Sample-Players.dir/signal_catch.cpp.o -c /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/signal_catch.cpp

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Sample-Players.dir/signal_catch.cpp.i"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/signal_catch.cpp > CMakeFiles/Sample-Players.dir/signal_catch.cpp.i

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Sample-Players.dir/signal_catch.cpp.s"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players/signal_catch.cpp -o CMakeFiles/Sample-Players.dir/signal_catch.cpp.s

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.requires:
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.requires

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.provides: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.requires
	$(MAKE) -f deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build.make deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.provides.build
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.provides

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.provides.build: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o

# Object files for target Sample-Players
Sample__Players_OBJECTS = \
"CMakeFiles/Sample-Players.dir/kbhit.cpp.o" \
"CMakeFiles/Sample-Players.dir/main.cpp.o" \
"CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o" \
"CMakeFiles/Sample-Players.dir/signal_catch.cpp.o"

# External object files for target Sample-Players
Sample__Players_EXTERNAL_OBJECTS =

bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o
bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o
bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o
bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o
bin/Sample-Players: lib/libOpenNI.dylib
bin/Sample-Players: lib/libusb.dylib
bin/Sample-Players: /usr/lib/libdl.dylib
bin/Sample-Players: lib/libTinyXml.a
bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build.make
bin/Sample-Players: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../../../../bin/Sample-Players"
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Sample-Players.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build: bin/Sample-Players
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/build

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/requires: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/kbhit.cpp.o.requires
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/requires: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/main.cpp.o.requires
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/requires: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/SceneDrawer.cpp.o.requires
deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/requires: deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/signal_catch.cpp.o.requires
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/requires

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/clean:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players && $(CMAKE_COMMAND) -P CMakeFiles/Sample-Players.dir/cmake_clean.cmake
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/clean

deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/depend:
	cd /Users/iowen8/nburrus-nestk-1bbac78/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/iowen8/nburrus-nestk-1bbac78 /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Nite/Samples/Players /Users/iowen8/nburrus-nestk-1bbac78/build /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players /Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/openni/Nite/Samples/Players/CMakeFiles/Sample-Players.dir/depend
