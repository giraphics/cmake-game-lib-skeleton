@echo off

REM BUILDING RELEASE
cd MyEngine
mkdir build
cd build
cmake ..
cmake --build . --config Release
cmake --install . --prefix ../../my-install-dir --config Release
cd ..
cd ..

cd MyGame
mkdir build
cd build
cmake ..
cmake --build . --config Release
cd ..
cd ..

ECHO ">>>>>>>>>>>>>>>>> RUNNING RELEASE EXECUTABLE <<<<<<<<<<<<<<<<<<<<<"
MyGame\build\Release\MyGame.exe

cd MyEngine
mkdir build
cd build
cmake ..
cmake --build . --config Debug
cmake --install . --prefix ../../my-install-dir --config Debug
cd ..
cd ..
cd MyGame
mkdir build
cd build
cmake ..
cmake --build . --config Debug
cd ..
cd ..

ECHO ">>>>>>>>>>>>>>>>> RUNNING DEBUG EXECUTABLE <<<<<<<<<<<<<<<<<<<<<"
MyGame\build\Debug\MyGame.exe