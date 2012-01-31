# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/openni

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/." TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./IXnNodeAllocator.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnAlgorithms.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnArray.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnBaseNode.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnBitSet.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnCallback.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnCodecIDs.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnContext.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnCppWrapper.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnDataTypes.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnDump.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnEnumerationErrors.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnEvent.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnFPSCalculator.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnGeneralBuffer.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnHash.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnInternalDefs.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnLicensing.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnList.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnLog.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnLogTypes.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnLogWriterBase.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnMacros.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnModuleCFunctions.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnModuleCppInterface.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnModuleCppRegistratration.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnModuleInterface.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnNode.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnNodeAllocator.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnOpenNI.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnOS.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnOSCpp.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnOSMemory.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnOSStrings.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnPlatform.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnPrdNode.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnPrdNodeInfo.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnPrdNodeInfoList.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnProfiling.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnPropNames.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnQueries.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnQueue.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnScheduler.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnStack.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnStatus.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnStatusCodes.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnStatusRegister.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnStringsHash.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnThreadSafeQueue.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnTypes.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnUSB.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnUSBDevice.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnUtils.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/./XnVersion.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/MacOSX" TYPE FILE FILES "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/MacOSX/XnPlatformMacOSX.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Linux-x86" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/Linux-x86/XnOSLinux-x86.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/Linux-x86/XnPlatformLinux-x86.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Linux-Arm" TYPE FILE FILES "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/Linux-Arm/XnPlatformLinux-Arm.h")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Win32" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/Win32/XnOSWin32.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/openni/Include/Win32/XnPlatformWin32.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin/" TYPE DIRECTORY FILES "/Users/iowen8/nburrus-nestk-1bbac78/build/bin/config")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/External/TinyXml/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/OpenNI/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Modules/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Source/Utils/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/SensorKinect/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/openni/Nite/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

