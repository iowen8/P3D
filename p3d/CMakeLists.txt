#
# Root nestk
#
#   nicolas.burrus@ensta.fr

project(p3d)
SET(NESTK_USE_PCL 1)
SET(NESTK_USE_OPENNI 1)

ADD_SUBDIRECTORY(nestk)
INCLUDE(${NESTK_EMBEDDED_USE_FILE})

INCLUDE_DIRECTORIES("${p3d_SOURCE_DIR}")
INCLUDE_DIRECTORIES("${p3d_BINARY_DIR}")
SET (p3d_sources
		Camera/niKinect.h
		Camera/niKinect.cpp
		Camera/multiNiKinect.h
		Camera/multiNiKinect.cpp
		CoordinateSpace/baseCoordinateSpace.h
		CoordinateSpace/baseCoordinateSpace.cpp
		CoordinateSpace/cameraCoordinateSpace.h
		CoordinateSpace/cameraCoordinateSpace.cpp
)

ADD_LIBRARY(p3d STATIC ${p3d_sources})

TARGET_LINK_LIBRARIES(p3d
  nestk
)

SET_TARGET_PROPERTIES(p3d PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}"
  RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}"
)

MACRO(INSTALL_NOBASE_HEADER_FILES prefix)
FOREACH(file ${ARGN})
  IF(${file} MATCHES "\\.(h|txx)(\\.in)?$")
    STRING(REGEX REPLACE "\\.in$" "" install_file ${file})
    GET_FILENAME_COMPONENT(dir ${install_file} PATH)
    INSTALL_FILES(${prefix}/${dir} FILES ${install_file})
  ENDIF(${file} MATCHES "\\.(h|txx)(\\.in)?$")
ENDFOREACH(file ${filelist})
ENDMACRO(INSTALL_NOBASE_HEADER_FILES)

INSTALL(TARGETS p3d DESTINATION lib)
INSTALL_NOBASE_HEADER_FILES(include/p3d ${p3d_sources})
