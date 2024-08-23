cmake_minimum_required(VERSION 3.10)

# Project name
project(MyGame VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_MODULE_PATH "C:/Dev/giraphics/cpp-game-lib/cmake-game-lib-skeleton/my-install-dir/cmake")

# Find the library (assuming it was installed globally or in a known directory)
find_package(MyEngine REQUIRED)


# Add the executable
add_executable(MyGame src/main.cpp)

#target_include_directories(MyGame PRIVATE C:/Dev/giraphics/cpp-game-lib/cmake-game-lib-skeleton/my-install-dir/include)

# Link the library to the executable
target_link_libraries(MyGame PRIVATE MyEngine::MyEngine)
