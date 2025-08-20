# AudioPluginTemplate

## Cloning

This repository can be cloned for a new starting point for a JUCE audio plugin project

```
git clone git@github.com:fullfxmedia/juce-template.git new-plugin
cd new-plugin
./scripts/init.sh NewPlugin
git remote rm origin
git remote add origin <new repo url>
```

## CMake

### Configure

OSX Apple Silicon

> cmake -S . -B build -DBUILD_STANDALONE=ON -DCMAKE_OSX_ARCHITECTURES=arm64

Linux/Windows

> cmake -S . -B build

### Build

> cmake --build build --config Release
