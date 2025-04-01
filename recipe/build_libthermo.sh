rm -rf build
mkdir build
cd build

if [[ $PKG_NAME == "libthermo" ]]; then
    cmake .. ${CMAKE_ARGS}              \
        -GNinja                         \
        -DCMAKE_BUILD_TYPE="Release"    \
        -DLIBTHERMO_USE_XTENSOR=OFF
elif [[ $PKG_NAME == "pythermo" ]]; then
    cmake .. ${CMAKE_ARGS}              \
        -GNinja                         \
        -DCMAKE_BUILD_TYPE="Release"    \
        -DPython_EXECUTABLE=$PYTHON     \
        -DLIBTHERMO_USE_XTENSOR=OFF     \
        -DBUILD_PY=ON
fi

ninja

ninja install

if [[ $PKG_NAME == "pythermo" ]]; then
    cd ../pythermo
    rm -rf build
    $PYTHON -m pip install . --no-deps -vv
    find pythermo/pythermo_core* -type f -print0 | xargs -0 rm -f --
fi
