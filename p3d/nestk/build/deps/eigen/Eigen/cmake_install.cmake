# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen

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
   "/usr/local/include/eigen3/Eigen/Array;/usr/local/include/eigen3/Eigen/Cholesky;/usr/local/include/eigen3/Eigen/Core;/usr/local/include/eigen3/Eigen/Dense;/usr/local/include/eigen3/Eigen/Eigen;/usr/local/include/eigen3/Eigen/Eigen2Support;/usr/local/include/eigen3/Eigen/Eigenvalues;/usr/local/include/eigen3/Eigen/Geometry;/usr/local/include/eigen3/Eigen/Householder;/usr/local/include/eigen3/Eigen/Jacobi;/usr/local/include/eigen3/Eigen/LeastSquares;/usr/local/include/eigen3/Eigen/LU;/usr/local/include/eigen3/Eigen/QR;/usr/local/include/eigen3/Eigen/QtAlignedMalloc;/usr/local/include/eigen3/Eigen/Sparse;/usr/local/include/eigen3/Eigen/StdDeque;/usr/local/include/eigen3/Eigen/StdList;/usr/local/include/eigen3/Eigen/StdVector;/usr/local/include/eigen3/Eigen/SVD")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Array"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Cholesky"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Core"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Dense"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Eigen"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Eigen2Support"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Eigenvalues"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Geometry"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Householder"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Jacobi"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/LeastSquares"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/LU"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/QR"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/QtAlignedMalloc"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/Sparse"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/StdDeque"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/StdList"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/StdVector"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/Eigen/SVD"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/eigen/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

