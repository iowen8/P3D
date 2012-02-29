
INCLUDE(../${P3D_EMBEDDED_USE_FILE})

ADD_EXECUTABLE(pmain pmain.cpp)
ADD_EXECUTABLE(adjustAngle adjustAngle.cpp)
ADD_EXECUTABLE(calibrate calibrate.cpp)
ADD_EXECUTABLE(board board.cpp)
ADD_EXECUTABLE(createNiXMLFile createNiKinectXMLFile.cpp)
TARGET_LINK_LIBRARIES(pmain p3d)
TARGET_LINK_LIBRARIES(board p3d)
TARGET_LINK_LIBRARIES(adjustAngle p3d)
TARGET_LINK_LIBRARIES(calibrate  p3d)
TARGET_LINK_LIBRARIES(createNiXMLFile p3d)
