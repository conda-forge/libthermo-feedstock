rm -rf build
mkdir build

cmake -S . -B build ${CMAKE_ARGS}   \
    -GNinja                         \
    -DCMAKE_BUILD_TYPE="Release"

ninja -C build

ninja -C build install
