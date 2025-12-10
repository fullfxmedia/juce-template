cmake_minimum_required(VERSION 3.26)

project(AudioPluginTemplate VERSION 0.0.1 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs)
include(cmake/cpm.cmake)

CPMAddPackage(
    NAME JUCE
    GITHUB_REPOSITORY juce-framework/JUCE
    GIT_TAG 8.0.8
    VERSION 8.0.8
    SOURCE_DIR ${LIB_DIR}/juce
)

CPMAddPackage(
    NAME moonbase_JUCEClient
    GIT_REPOSITORY git@github.com:Moonbase-sh/moonbase_JUCEClient.git
    GIT_TAG main
    SOURCE_DIR ${LIB_DIR}/moonbase_JUCEClient
)

if (MSVC)
    add_compile_options(/Wall /WX)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

add_subdirectory(plugin)
