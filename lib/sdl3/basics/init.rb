# frozen_string_literal: true

# Wrapper for SDL_init.h
# Handles Initialization and Shutdown
#
module SDL3
  # Macros
  INIT_AUDIO    = 0x00000010
  INIT_VIDEO    = 0x00000020
  INIT_JOYSTICK = 0x00000200
  INIT_HAPTIC   = 0x00001000
  INIT_GAMEPAD  = 0x00002000
  INIT_EVENTS   = 0x00004000
  INIT_SENSOR   = 0x00008000
  INIT_CAMERA   = 0x00010000

  PROP_APP_METADATA_NAME_STRING       = 'SDL.app.metadata.name'
  PROP_APP_METADATA_VERSION_STRING    = 'SDL.app.metadata.version'
  PROP_APP_METADATA_IDENTIFIER_STRING = 'SDL.app.metadata.identifier'
  PROP_APP_METADATA_CREATOR_STRING    = 'SDL.app.metadata.creator'
  PROP_APP_METADATA_COPYRIGHT_STRING  = 'SDL.app.metadata.copyright'
  PROP_APP_METADATA_URL_STRING        = 'SDL.app.metadata.url'
  PROP_APP_METADATA_TYPE_STRING       = 'SDL.app.metadata.type'

  # Enums
  enum :app_result, %i[
    app_continue
    app_success
    app_failure
  ]

  # Functions
  attach_function :init, :SDL_Init, [:uint32], :int
  attach_function :quit, :SDL_Quit, [], :void
end
