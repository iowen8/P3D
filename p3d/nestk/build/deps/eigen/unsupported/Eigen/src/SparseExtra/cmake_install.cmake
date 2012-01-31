# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra

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
   "/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/Amd.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/CholmodSupport.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/CholmodSupportLegacy.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/RandomSetter.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SimplicialCholesky.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/Solve.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLDLT.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLDLTLegacy.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLLT.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SparseLU.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/SuperLUSupport.h;/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra/UmfPackSupport.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/unsupported/Eigen/src/SparseExtra" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/Amd.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/CholmodSupport.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/CholmodSupportLegacy.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/RandomSetter.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SimplicialCholesky.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/Solve.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLDLT.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLDLTLegacy.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLLT.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SparseLU.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/SuperLUSupport.h"
    "/Users/iowen8/nburrus-nestk-1bbac78/deps/eigen/unsupported/Eigen/src/SparseExtra/UmfPackSupport.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

