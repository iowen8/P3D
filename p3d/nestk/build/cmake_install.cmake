# Install script for directory: /Users/iowen8/nburrus-nestk-1bbac78

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cmake" TYPE FILE FILES
    "/Users/iowen8/nburrus-nestk-1bbac78/build/UseNestk.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/find_nestk_deps.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindCMinpack.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindEigen3.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindFlann.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindFreenect.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindGLEW.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindOpenNI.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindQhull.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/FindUSB.cmake"
    "/Users/iowen8/nburrus-nestk-1bbac78/cmake/LibFindMacros.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/deps/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/ntk/cmake_install.cmake")
  INCLUDE("/Users/iowen8/nburrus-nestk-1bbac78/build/samples/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/Users/iowen8/nburrus-nestk-1bbac78/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/Users/iowen8/nburrus-nestk-1bbac78/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
