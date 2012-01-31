# Install script for directory: /Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core

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
   "/usr/local/include/eigen3/Eigen/src/Core/Array.h;/usr/local/include/eigen3/Eigen/src/Core/ArrayBase.h;/usr/local/include/eigen3/Eigen/src/Core/ArrayWrapper.h;/usr/local/include/eigen3/Eigen/src/Core/Assign.h;/usr/local/include/eigen3/Eigen/src/Core/BandMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/Block.h;/usr/local/include/eigen3/Eigen/src/Core/BooleanRedux.h;/usr/local/include/eigen3/Eigen/src/Core/CommaInitializer.h;/usr/local/include/eigen3/Eigen/src/Core/CwiseBinaryOp.h;/usr/local/include/eigen3/Eigen/src/Core/CwiseNullaryOp.h;/usr/local/include/eigen3/Eigen/src/Core/CwiseUnaryOp.h;/usr/local/include/eigen3/Eigen/src/Core/CwiseUnaryView.h;/usr/local/include/eigen3/Eigen/src/Core/DenseBase.h;/usr/local/include/eigen3/Eigen/src/Core/DenseCoeffsBase.h;/usr/local/include/eigen3/Eigen/src/Core/DenseStorage.h;/usr/local/include/eigen3/Eigen/src/Core/DenseStorageBase.h;/usr/local/include/eigen3/Eigen/src/Core/Diagonal.h;/usr/local/include/eigen3/Eigen/src/Core/DiagonalMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/DiagonalProduct.h;/usr/local/include/eigen3/Eigen/src/Core/Dot.h;/usr/local/include/eigen3/Eigen/src/Core/EigenBase.h;/usr/local/include/eigen3/Eigen/src/Core/Flagged.h;/usr/local/include/eigen3/Eigen/src/Core/ForceAlignedAccess.h;/usr/local/include/eigen3/Eigen/src/Core/Functors.h;/usr/local/include/eigen3/Eigen/src/Core/Fuzzy.h;/usr/local/include/eigen3/Eigen/src/Core/GenericPacketMath.h;/usr/local/include/eigen3/Eigen/src/Core/GlobalFunctions.h;/usr/local/include/eigen3/Eigen/src/Core/IO.h;/usr/local/include/eigen3/Eigen/src/Core/Map.h;/usr/local/include/eigen3/Eigen/src/Core/MapBase.h;/usr/local/include/eigen3/Eigen/src/Core/MathFunctions.h;/usr/local/include/eigen3/Eigen/src/Core/Matrix.h;/usr/local/include/eigen3/Eigen/src/Core/MatrixBase.h;/usr/local/include/eigen3/Eigen/src/Core/MatrixStorage.h;/usr/local/include/eigen3/Eigen/src/Core/NestByValue.h;/usr/local/include/eigen3/Eigen/src/Core/NoAlias.h;/usr/local/include/eigen3/Eigen/src/Core/NumTraits.h;/usr/local/include/eigen3/Eigen/src/Core/PermutationMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/PlainObjectBase.h;/usr/local/include/eigen3/Eigen/src/Core/Product.h;/usr/local/include/eigen3/Eigen/src/Core/ProductBase.h;/usr/local/include/eigen3/Eigen/src/Core/Random.h;/usr/local/include/eigen3/Eigen/src/Core/Redux.h;/usr/local/include/eigen3/Eigen/src/Core/Replicate.h;/usr/local/include/eigen3/Eigen/src/Core/ReturnByValue.h;/usr/local/include/eigen3/Eigen/src/Core/Reverse.h;/usr/local/include/eigen3/Eigen/src/Core/Select.h;/usr/local/include/eigen3/Eigen/src/Core/SelfAdjointView.h;/usr/local/include/eigen3/Eigen/src/Core/SelfCwiseBinaryOp.h;/usr/local/include/eigen3/Eigen/src/Core/SolveTriangular.h;/usr/local/include/eigen3/Eigen/src/Core/StableNorm.h;/usr/local/include/eigen3/Eigen/src/Core/Stride.h;/usr/local/include/eigen3/Eigen/src/Core/Swap.h;/usr/local/include/eigen3/Eigen/src/Core/Transpose.h;/usr/local/include/eigen3/Eigen/src/Core/Transpositions.h;/usr/local/include/eigen3/Eigen/src/Core/TriangularMatrix.h;/usr/local/include/eigen3/Eigen/src/Core/VectorBlock.h;/usr/local/include/eigen3/Eigen/src/Core/VectorwiseOp.h;/usr/local/include/eigen3/Eigen/src/Core/Visitor.h")
FILE(INSTALL DESTINATION "/usr/local/include/eigen3/Eigen/src/Core" TYPE FILE FILES
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Array.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/ArrayBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/ArrayWrapper.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Assign.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/BandMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Block.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/BooleanRedux.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/CommaInitializer.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/CwiseBinaryOp.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/CwiseNullaryOp.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryOp.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/CwiseUnaryView.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DenseBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DenseCoeffsBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DenseStorage.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DenseStorageBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Diagonal.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DiagonalMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/DiagonalProduct.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Dot.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/EigenBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Flagged.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/ForceAlignedAccess.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Functors.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Fuzzy.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/GenericPacketMath.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/GlobalFunctions.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/IO.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Map.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/MapBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/MathFunctions.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Matrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/MatrixBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/MatrixStorage.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/NestByValue.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/NoAlias.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/NumTraits.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/PermutationMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/PlainObjectBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Product.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/ProductBase.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Random.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Redux.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Replicate.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/ReturnByValue.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Reverse.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Select.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/SelfAdjointView.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/SelfCwiseBinaryOp.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/SolveTriangular.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/StableNorm.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Stride.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Swap.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Transpose.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Transpositions.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/TriangularMatrix.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/VectorBlock.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/VectorwiseOp.h"
    "/Users/iowen8/P3D/p3d/nestk/deps/eigen/Eigen/src/Core/Visitor.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/iowen8/P3D/build/p3d/nestk/deps/eigen/Eigen/src/Core/products/cmake_install.cmake")
  INCLUDE("/Users/iowen8/P3D/build/p3d/nestk/deps/eigen/Eigen/src/Core/util/cmake_install.cmake")
  INCLUDE("/Users/iowen8/P3D/build/p3d/nestk/deps/eigen/Eigen/src/Core/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

