# AudioPluginTemplate

## Cloning

This repository can be cloned for a new starting point for a JUCE audio plugin project.

## Repository layout

- `plugin/` &mdash; C++ sources for the JUCE plug-in target.
  - `plugin/include/AudioPluginTemplate/` &mdash; Public headers that are safe to include from other translation units.
  - `plugin/source/` &mdash; Implementation files for the editor and processor classes.
- `cmake/` &mdash; Helper CMake modules (CPM initialisation, shared logic, etc.).
- `scripts/` &mdash; Automation helpers, including the `init.sh` bootstrap script for renaming the template.

When starting a new project, update both the header and source lists in `plugin/CMakeLists.txt` to include any additional files you add under `plugin/include` or `plugin/source`.

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
