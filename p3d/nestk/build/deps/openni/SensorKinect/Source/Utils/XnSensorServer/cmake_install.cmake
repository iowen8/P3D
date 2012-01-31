# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/openni/SensorKinect/Source/Utils/XnSensorServer

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE EXECUTABLE FILES "/Users/iowen8/nburrus-nestk-1bbac78/build/bin/XnSensorServer")
  IF(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./XnSensorServer" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./XnSensorServer")
    EXECUTE_PROCESS(COMMAND "/usr/bin/install_name_tool"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libOpenNI.dylib" "libOpenNI.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libXnCore.dylib" "libXnCore.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libXnDDK.dylib" "libXnDDK.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libXnDevicesSensorV2.dylib" "libXnDevicesSensorV2.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libXnFormats.dylib" "libXnFormats.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libnimCodecs.dylib" "libnimCodecs.dylib"
      -change "/Users/iowen8/nburrus-nestk-1bbac78/build/lib/libusb.dylib" "libusb.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./XnSensorServer")
    IF(CMAKE_INSTALL_DO_STRIP)
      EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/./XnSensorServer")
    ENDIF(CMAKE_INSTALL_DO_STRIP)
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

