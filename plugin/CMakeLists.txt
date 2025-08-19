cmake_minimum_required(VERSION 4.0.2)

project(AudioPluginTemplate VERSION 0.1.0)

juce_add_plugin(${PROJECT_NAME}
    COMPANY_NAME FullFXMedia
    IS_SYNTH FALSE
    NEEDS_MIDI_INPUT FALSE
    NEEDS_MIDI_OUTPUT FALSE
    PLUGIN_MANUFACTURER_CODE "FUXM"
    PLUGIN_CODE "AUXT"
    FORMATS AU VST3
    PRODUCT_NAME "AudioPluginTemplate"
    BUNDLE_ID "com.fullfxmedia.audioplugintemplate"
)

target_sources(${PROJECT_NAME}
    PRIVATE
        source/PluginEditor.cpp
        source/PluginProcessor.cpp
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        include
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
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