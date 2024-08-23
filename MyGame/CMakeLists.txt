cmake_minimum_required(VERSION 3.10)

# Project name
project(MyGame VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if (WIN32)
	set(CMAKE_MODULE_PATH "C:/Dev/giraphics/cpp-game-lib/cmake-game-lib-skeleton/my-install-dir/cmake")
elseif (APPLE)
    message(STATUS "CMAKE_MODULE_PATH not set for macOS")
elseif (UNIX)
	set(CMAKE_MODULE_PATH "/home/parminder/Parminder/Dev/orange/cmake-game-lib-skeleton/my-install-dir/cmake")
endif()

# Find the library (assuming it was installed globally or in a known directory)
find_package(MyEngine REQUIRED)

# Add the executable
add_executable(MyGame src/main.cpp)

# Link the library to the executable
target_link_libraries(MyGame PRIVATE MyEngine::MyEngine)
