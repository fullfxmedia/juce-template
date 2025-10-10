# Repository Guidelines

This template provides the starting point for JUCE-based audio plug-in projects. When updating this repository:

- Prefer modern CMake patterns (`project(... LANGUAGES CXX)`, target properties, etc.).
- Keep the project warning-clean and treat warnings as errors where possible.
- Document any noteworthy layout or workflow details in the README so future projects understand the structure.
- Place plug-in implementation headers under `plugin/include/<ProjectName>/` and source files under `plugin/source/`.
- Avoid introducing platform-specific assumptions without guarding them with the appropriate CMake checks.

## Layout Overview

- `plugin/` &mdash; JUCE plug-in target definition and code.
  - `plugin/include/` &mdash; Public headers for the plug-in module.
  - `plugin/source/` &mdash; Implementation files for the plug-in editor and processor.
- `cmake/` &mdash; Helper CMake modules (e.g. CPM bootstrap).
- `scripts/` &mdash; Utility scripts such as project initialisation helpers.

When adding new source files, remember to list them in `plugin/CMakeLists.txt` so they are included in the target build.
