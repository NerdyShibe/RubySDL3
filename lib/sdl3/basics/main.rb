# frozen_string_literal: true

module SDL3
  # Wrapper for SDL_main.h
  # Handles Application entry points
  #
  module Main
    SDL3.attach_function :quit, :SDL_Quit, [], :void
  end
end
