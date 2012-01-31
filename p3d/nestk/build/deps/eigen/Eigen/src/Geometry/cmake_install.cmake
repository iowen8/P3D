# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry

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
   "/usr/local/include/eigen3/Eigen/src/Geometry/AlignedBox.h;/usr/local/include/eigen3/Eigen/src/Geometry/AngleAxis.h;/usr/local/include/eigen3/Eigen/src/Geometry/EulerAngles.h;/usr/local/include/eigen3/Eigen/src/Geometry/Homogeneous.h;/usr/local/include/eigen3/Eigen/src/Geometry/Hyperplane.h;/usr/local/include/eigen3/Eigen/src/Geometry/OrthoMethods.h;/usr/local/include/eigen3/Eigen/src/Geometry/ParametrizedLine.h;/usr/local/include/eigen3/Eigen/src/Geometry/Quaternion.h;/usr/local/include/eigen3/Eigen/src/Geometry/Rotation2D.h;/usr/local/include/eigen3/Eigen/src/Geometry/RotationBase.h;/usr/local/include/eigen3/Eigen/src/Geometry/Scaling.h;/usr/local/include/eigen3/Eigen/src/Geometry/Transform.h;/usr/local/include/eigen3/Eigen/src/Geometry/Translation.h;/usr/local/include/eigen3/Eigen/src/Geometry/Umeyama.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Geometry" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/AlignedBox.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/AngleAxis.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/EulerAngles.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Homogeneous.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Hyperplane.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/OrthoMethods.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/ParametrizedLine.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Quaternion.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Rotation2D.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/RotationBase.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Scaling.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Transform.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Translation.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/src/Geometry/Umeyama.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/eigen/Eigen/src/Geometry/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

