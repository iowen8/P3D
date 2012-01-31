################################################################################
### extra flagssrc
################################################################################
IF(CMAKE_COMPILER_IS_GNUCXX)
  SET(DEFAULT_P3D_EXTRA_CMAKE_CXX_FLAGS "-fPIC -Wall -W -Wno-unused -Wno-sign-compare")
ENDIF(CMAKE_COMPILER_IS_GNUCXX)

SET(P3D_EXTRA_CMAKE_CXX_FLAGS  ${DEFAULT_P3D_EXTRA_CMAKE_CXX_FLAGS}
    CACHE STRING "Extra flags appended to CMAKE_CXX_FLAGS" )
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${P3D_EXTRA_CMAKE_CXX_FLAGS}" )

## Check if private part is enabled.
IF(IS_DIRECTORY "@P3D_SOURCE_DIR@/p3d/private")
  ADD_DEFINITIONS(-DNESTK_PRIVATE)
  SET(HAVE_P3D_PRIVATE 1 CACHE INTERNAL "Nestk private features are available")
ENDIF()

################################################################################
### Find dependencies
################################################################################
INCLUDE(${NESTK_EMBEDDED_USE_FILE})


INCLUDE_DIRECTORIES("@P3D_SOURCE_DIR@")
INCLUDE_DIRECTORIES("@P3D_BINARY_DIR@")
