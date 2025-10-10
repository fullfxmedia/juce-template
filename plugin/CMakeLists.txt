cmake_minimum_required(VERSION 3.26)

project(AudioPluginTemplate VERSION 0.0.1 LANGUAGES CXX)

option(BUILD_STANDALONE "Build standalone plugin format" OFF)
set(plugin_formats AU VST3)
if(BUILD_STANDALONE)
    list(APPEND plugin_formats Standalone)
endif()

juce_add_plugin(${PROJECT_NAME}
    COMPANY_NAME FullFXMedia
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT FALSE
    NEEDS_MIDI_OUTPUT FALSE
    PLUGIN_MANUFACTURER_CODE "FUXM"
    PLUGIN_CODE "AUXT"
    FORMATS ${plugin_formats}
    PRODUCT_NAME "AudioPluginTemplate"
    BUNDLE_ID "com.fullfxmedia.audioplugintemplate"
    COPY_PLUGIN_AFTER_BUILD TRUE
)

set(plugin_sources
    source/PluginEditor.cpp
    source/PluginProcessor.cpp
)

set(plugin_headers
    include/AudioPluginTemplate/PluginEditor.h
    include/AudioPluginTemplate/PluginProcessor.h
)

juce_generate_juce_header(${PROJECT_NAME})

target_sources(${PROJECT_NAME}
    PRIVATE
        ${plugin_sources}
        ${plugin_headers}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        include
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        juce::juce_core
        juce::juce_graphics
        juce::juce_gui_basics
        juce::juce_audio_utils
    PUBLIC
        juce::juce_recommended_config_flags
        juce::juce_recommended_lto_flags
        juce::juce_recommended_warning_flags
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
        JUCE_WEB_BROWSER=0
        JUCE_USE_CURL=0
        JUCE_VST3_CAN_REPLACE_VST2=0
        JUCE_PLUGINHOST_VST=0
)

if(APPLE)
    target_compile_definitions(${PROJECT_NAME} PUBLIC JUCE_AU=1)
endif()
