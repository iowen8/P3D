#
# Root nestk
#
#   nicolas@burrus.name

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
if(COMMAND cmake_policy)
    cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

PROJECT(nestk_deps)
SET(NESTK_DEPS_VERSION 0.1)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${nestk_deps_SOURCE_DIR}/cmake)

INCLUDE( ${nestk_deps_SOURCE_DIR}/cmake/utils.cmake )
INCLUDE( ${nestk_deps_SOURCE_DIR}/cmake/msvc.cmake )

IF(NOT NESTK_USE_ROS)

  ## LIBUSB
  IF (NOT LIBUSB_1_INCLUDE_DIR)
    if(WIN32)
      set(LIBUSB_1_INCLUDE_DIR "${nestk_deps_SOURCE_DIR}/win32/libusb-1.0/include" CACHE FILEPATH "" FORCE)
      IF (CMAKE_COMPILER_IS_GNUCXX)
        set(LIBUSB_1_LIBRARY "${nestk_deps_SOURCE_DIR}/win32/libusb-1.0/lib/gcc/libusb.a" CACHE FILEPATH "" FORCE)
      ELSE()
        set(LIBUSB_1_LIBRARY "${nestk_deps_SOURCE_DIR}/win32/libusb-1.0/lib/msvc/libusb.lib" CACHE FILEPATH "" FORCE)
      ENDIF()
    ELSEIF(APPLE)
      IF (NOT LIBUSB_1_INCLUDE_DIR)
        set(LIBUSB_1_INCLUDE_DIR "${nestk_deps_SOURCE_DIR}/macosx/libusb-7da756e" CACHE FILEPATH "" FORCE)
        set(LIBUSB_1_LIBRARY "usb" CACHE FILEPATH "" FORCE)
        set(USE_EMBEDDED_LIBUSB 1 CACHE INTERNAL "")
      ENDIF()
    ENDIF()
  
  IF(APPLE AND USE_EMBEDDED_LIBUSB)
    ADD_SUBDIRECTORY("${nestk_deps_SOURCE_DIR}/macosx/libusb-7da756e")
  ENDIF()
  INCLUDE_DIRECTORIES(${LIBUSB_1_INCLUDE_DIR})
  FIND_PACKAGE(libusb-1.0 REQUIRED)
ENDIF()

## GLUT
if(WIN32)
  IF (NOT GLUT_INCLUDE_DIR)
    IF (CMAKE_COMPILER_IS_GNUCXX)
      set(GLUT_INCLUDE_DIR "${nestk_deps_SOURCE_DIR}/win32/freeglut/include" CACHE FILEPATH "" FORCE)
      set(GLUT_glut_LIBRARY "${nestk_deps_SOURCE_DIR}/win32/freeglut/lib/libfreeglut.a" CACHE FILEPATH "" FORCE)
    ELSE()
      set(GLUT_INCLUDE_DIR "${nestk_deps_SOURCE_DIR}/win32/glut-msvc" CACHE FILEPATH "" FORCE)
      set(GLUT_glut_LIBRARY "${nestk_deps_SOURCE_DIR}/win32/glut-msvc/glut32.lib" CACHE FILEPATH "" FORCE)
    ENDIF()
  ENDIF()
  INCLUDE_DIRECTORIES(${GLUT_INCLUDE_DIR})
endif()


ENDIF(NOT NESTK_USE_ROS)

################################################################################
# cmake scripts
################################################################################
ADD_SUBDIRECTORY(cmake)
