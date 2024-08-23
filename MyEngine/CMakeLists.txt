cmake_minimum_required(VERSION 3.10)

# Project name
project(MyEngine VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the library
add_library(MyEngine STATIC
    src/MyEngine.cpp
)

# Include directories
target_include_directories(MyEngine PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

# Specify output locations for the library and include headers
install(TARGETS MyEngine
    EXPORT MyEngineConfig
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
install(DIRECTORY include/ DESTINATION include)

# Export the configuration to be used by other projects
install(EXPORT MyEngineConfig
    NAMESPACE MyEngine::
    DESTINATION C:/Dev/giraphics/cmake-game-lib-skeleton-1/MyEngine/build/cmake
)
