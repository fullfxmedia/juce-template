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