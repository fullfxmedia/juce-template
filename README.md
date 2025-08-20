# Plugin Tempalte

## CMake

### Configure

OSX Apple Silicon

> cmake -S . -B build -DBUILD_STANDALONE=ON -DCMAKE_OSX_ARCHITECTURES=arm64

Linux/Windows

> cmake -S . -B build

### Build

> cmake --build build --config Release
