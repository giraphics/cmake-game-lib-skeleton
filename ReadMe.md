Here's an example of how to set up a CMake project to create a C++ library and then consume that library in a separate project. This setup includes two main parts: the C++ library and the project that uses (or consumes) that library.

# Creating a C++ Library with CMake

Assume the library is named MyEngine.

**Project Structure**

```
Copy code
MyEngine/
│
├── CMakeLists.txt
├── include/
│   └── MyEngine/
│       └── MyEngine.h
└── src/
    └── MyEngine.cpp
```

`CMakeLists.txt` for the Library

```
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
    DESTINATION lib/cmake/MyEngine
)
```

## Consuming the Library in a Project

Assume the consuming project is named `MyGame`.

**Project Structure**

```
MyGame/
│
├── CMakeLists.txt
└── src/
    └── main.cpp
```

`CMakeLists.txt` for the Consuming Project

```
cmake_minimum_required(VERSION 3.10)

# Project name

project(MyGame VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the library (assuming it was installed globally or in a known directory)

find_package(MyEngine REQUIRED)

# Add the executable

add_executable(MyGame src/main.cpp)

# Link the library to the executable
target_link_libraries(MyGame PRIVATE MyEngine::MyEngine) 
```

## Building the Library and Consuming Project

**Step 1: Build the Library**

```
cd MyEngine
mkdir build
cd build
cmake ..
cmake --build . --config Release
cmake --install . --prefix ../../my-install-dir --config Release
```

This will generate the static library **libMyEngine.a** (or **.lib** on Windows) and install the headers and configuration files as specified in the CMakeLists.txt.

**Step 2: Build the Consuming Project**
Note: Add CMAKE_MODULE_PATH in the CMakeLists.txt to indicate the desire path of installed directory(which is the path of 'my-install-dir' here)

```
cd MyGame
mkdir build
cd build
cmake ..
cmake --build . --config Debug
```

The `find_package(MyEngine REQUIRED)` command in `MyGame` will look for the `MyEngineConfig.cmake` file installed by the library, allowing `MyGame` to link against `MyEngine`.

**Explanation:**
**Creating the Library:**

`add_library(MyEngine STATIC ...)` creates a static library from the source files.
`target_include_directories(MyEngine PUBLIC ...)` specifies the include directories that should be used by consumers of the library.
`install(TARGETS MyEngine ...)` sets up the installation rules, placing the library and headers in appropriate locations.
`install(EXPORT ...)` generates a CMake configuration file (`MyEngineConfig.cmake`) to be used by other projects.
**Consuming the Library:**

`find_package(MyEngine REQUIRED)` locates the installed library and its configuration.
`target_link_libraries(MyGame PRIVATE MyEngine::MyEngine)` links the `MyEngine` library with the `MyGame` executable.
This setup ensures that your library can be easily consumed by other projects, with CMake handling the details of include directories, linking, and build configurations.