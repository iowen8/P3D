# Install script for directory: /Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues

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
   "/usr/local/include/eigen3/Eigen/src/Eigenvalues/ComplexEigenSolver.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/ComplexSchur.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/EigenSolver.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/EigenvaluesCommon.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/HessenbergDecomposition.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/RealSchur.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h;/usr/local/include/eigen3/Eigen/src/Eigenvalues/Tridiagonalization.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Eigenvalues" TYPE FILE FILES
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/ComplexEigenSolver.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/ComplexSchur.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/EigenSolver.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/EigenvaluesCommon.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/HessenbergDecomposition.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/RealSchur.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Eigenvalues/Tridiagonalization.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

