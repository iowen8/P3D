# Install script for directory: /Users/iowen8/P3D/p3d/nestk/deps/eigen/unsupported/Eigen/src/Polynomials

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
   "/usr/local/include/eigen3/unsupported/Eigen/src/Polynomials/Companion.h;/usr/local/include/eigen3/unsupported/Eigen/src/Polynomials/PolynomialSolver.h;/usr/local/include/eigen3/unsupported/Eigen/src/Polynomials/PolynomialUtils.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/unsupported/Eigen/src/Polynomials" TYPE FILE FILES
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/unsupported/Eigen/src/Polynomials/Companion.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/unsupported/Eigen/src/Polynomials/PolynomialSolver.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/unsupported/Eigen/src/Polynomials/PolynomialUtils.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

