# @echo off

# REM BUILDING RELEASE
cd MyEngine
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release
cmake --install . --prefix ../../my-install-dir --config Release
cd ..
cd ..

cd MyGame
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release
cd ..
cd ..

echo ">>>>>>>>>>>>>>>>> RUNNING RELEASE EXECUTABLE <<<<<<<<<<<<<<<<<<<<<"
./MyGame/build/MyGame

cd MyEngine
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug
cmake --install . --prefix ../../my-install-dir --config Debug
cd ..
cd ..

cd MyGame
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug
cd ..
cd ..

echo ">>>>>>>>>>>>>>>>> RUNNING DEBUG EXECUTABLE <<<<<<<<<<<<<<<<<<<<<"
./MyGame/build/MyGame