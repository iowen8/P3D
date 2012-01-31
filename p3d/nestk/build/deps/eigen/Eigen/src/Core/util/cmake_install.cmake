# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  list(APPEND CPACK_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/eigen3/Eigen/src/Core/util/BlasUtil.h;/usr/local/include/eigen3/Eigen/src/Core/util/Constants.h;/usr/local/include/eigen3/Eigen/src/Core/util/DisableMSVCWarnings.h;/usr/local/include/eigen3/Eigen/src/Core/util/DisableStupidWarnings.h;/usr/local/include/eigen3/Eigen/src/Core/util/EnableMSVCWarnings.h;/usr/local/include/eigen3/Eigen/src/Core/util/ForwardDeclarations.h;/usr/local/include/eigen3/Eigen/src/Core/util/Macros.h;/usr/local/include/eigen3/Eigen/src/Core/util/Memory.h;/usr/local/include/eigen3/Eigen/src/Core/util/Meta.h;/usr/local/include/eigen3/Eigen/src/Core/util/ReenableStupidWarnings.h;/usr/local/include/eigen3/Eigen/src/Core/util/StaticAssert.h;/usr/local/include/eigen3/Eigen/src/Core/util/XprHelper.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Core/util" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/BlasUtil.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/Constants.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/DisableMSVCWarnings.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/DisableStupidWarnings.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/EnableMSVCWarnings.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/ForwardDeclarations.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/Macros.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/Memory.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/Meta.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/ReenableStupidWarnings.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/StaticAssert.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Core/util/XprHelper.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

