# frozen_string_literal: true

module SDL3
  # Wrapper for SDL_init.h
  # Handles Initialization and Shutdown
  #
  module Init
    # Constants
    SDL_INIT_AUDIO    = 0x00000010
    SDL_INIT_VIDEO    = 0x00000020
    SDL_INIT_JOYSTICK = 0x00000200
    SDL_INIT_HAPTIC   = 0x00001000
    SDL_INIT_GAMEPAD  = 0x00002000
    SDL_INIT_EVENTS   = 0x00004000
    SDL_INIT_SENSOR   = 0x00008000
    SDL_INIT_CAMERA   = 0x00010000

    # Enums
    SDL3.enum :sdl_app_result, [
      :sdl_app_continue, 0,
      :sdl_app_success,  1,
      :sdl_app_failure,  2
    ]

    SDL3.attach_function :init, :SDL_Init, [:uint32], :int
    SDL3.attach_function :quit, :SDL_Quit, [], :void
  end
end
