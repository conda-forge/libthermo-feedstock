@echo ON

rmdir /Q /S build
mkdir build

cmake -S . -B build ^
	%CMAKE_ARGS% ^
	-GNinja ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	-DCMAKE_PREFIX_PATH=%PREFIX% ^
	-DCMAKE_BUILD_TYPE="Release"

if errorlevel 1 exit 1

ninja -C build
if errorlevel 1 exit 1

ninja -C build install
if errorlevel 1 exit 1
