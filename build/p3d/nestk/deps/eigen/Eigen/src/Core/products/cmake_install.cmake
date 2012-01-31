# Install script for directory: /Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products

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
   "/usr/local/include/eigen3/Eigen/src/Core/products/CoeffBasedProduct.h;/usr/local/include/eigen3/Eigen/src/Core/products/GeneralBlockPanelKernel.h;/usr/local/include/eigen3/Eigen/src/Core/products/GeneralMatrixMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/products/GeneralMatrixMatrixTriangular.h;/usr/local/include/eigen3/Eigen/src/Core/products/GeneralMatrixVector.h;/usr/local/include/eigen3/Eigen/src/Core/products/Parallelizer.h;/usr/local/include/eigen3/Eigen/src/Core/products/SelfadjointMatrixMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/products/SelfadjointMatrixVector.h;/usr/local/include/eigen3/Eigen/src/Core/products/SelfadjointProduct.h;/usr/local/include/eigen3/Eigen/src/Core/products/SelfadjointRank2Update.h;/usr/local/include/eigen3/Eigen/src/Core/products/TriangularMatrixMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/products/TriangularMatrixVector.h;/usr/local/include/eigen3/Eigen/src/Core/products/TriangularSolverMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/products/TriangularSolverVector.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Core/products" TYPE FILE FILES
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/CoeffBasedProduct.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/GeneralBlockPanelKernel.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixMatrixTriangular.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/GeneralMatrixVector.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/Parallelizer.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointMatrixMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointMatrixVector.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointProduct.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/SelfadjointRank2Update.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/TriangularMatrixMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/TriangularMatrixVector.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/TriangularSolverMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/products/TriangularSolverVector.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

