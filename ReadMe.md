Here's an example of how to set up a CMake project to create a C++ library and then consume that library in a separate project. This setup includes two main parts: the C++ library and the project that uses (or consumes) that library.

# Creating a C++ Library with CMake

Assume the library is named MyLibrary.

**Project Structure**

```
Copy code
MyLibrary/
│
├── CMakeLists.txt
├── include/
│   └── MyLibrary/
│       └── MyLibrary.h
└── src/
    └── MyLibrary.cpp
```

`CMakeLists.txt` for the Library

```
cmake_minimum_required(VERSION 3.10)

# Project name
project(MyLibrary VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the library
add_library(MyLibrary STATIC
    src/MyLibrary.cpp
)

# Include directories
target_include_directories(MyLibrary PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

# Specify output locations for the library and include headers
install(TARGETS MyLibrary
    EXPORT MyLibraryConfig
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
install(DIRECTORY include/ DESTINATION include)

# Export the configuration to be used by other projects
install(EXPORT MyLibraryConfig
    NAMESPACE MyLibrary::
    DESTINATION lib/cmake/MyLibrary
)
```

## Consuming the Library in a Project

Assume the consuming project is named `MyApp`.

**Project Structure**

```
MyApp/
│
├── CMakeLists.txt
└── src/
    └── main.cpp
```

`CMakeLists.txt` for the Consuming Project

```
cmake_minimum_required(VERSION 3.10)

# Project name

project(MyApp VERSION 1.0.0 LANGUAGES CXX)

# Specify the C++ standard

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Find the library (assuming it was installed globally or in a known directory)

find_package(MyLibrary REQUIRED)

# Add the executable

add_executable(MyApp src/main.cpp)

# Link the library to the executable
target_link_libraries(MyApp PRIVATE MyLibrary::MyLibrary) 
```

## Building the Library and Consuming Project

**Step 1: Build the Library**

```
cd MyLibrary
mkdir build
cd build
cmake ..
cmake --build . --config Release
cmake --install . --prefix C:\path\to\install --config Release
```

This will generate the static library **libMyLibrary.a** (or **.lib** on Windows) and install the headers and configuration files as specified in the CMakeLists.txt.

**Step 2: Build the Consuming Project**

```
cd MyApp
mkdir build
cd build
cmake ..
cmake --build .
```

The `find_package(MyLibrary REQUIRED)` command in `MyApp` will look for the `MyLibraryConfig.cmake` file installed by the library, allowing `MyApp` to link against `MyLibrary`.

**Explanation:**
**Creating the Library:**

`add_library(MyLibrary STATIC ...)` creates a static library from the source files.
`target_include_directories(MyLibrary PUBLIC ...)` specifies the include directories that should be used by consumers of the library.
`install(TARGETS MyLibrary ...)` sets up the installation rules, placing the library and headers in appropriate locations.
`install(EXPORT ...)` generates a CMake configuration file (`MyLibraryConfig.cmake`) to be used by other projects.
**Consuming the Library:**

`find_package(MyLibrary REQUIRED)` locates the installed library and its configuration.
`target_link_libraries(MyApp PRIVATE MyLibrary::MyLibrary)` links the `MyLibrary` library with the `MyApp` executable.
This setup ensures that your library can be easily consumed by other projects, with CMake handling the details of include directories, linking, and build configurations.