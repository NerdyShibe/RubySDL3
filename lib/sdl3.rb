# frozen_string_literal: true

require 'debug'
require 'ffi'

# Ruby Wrapper for SDL3
#
module SDL3
  extend FFI::Library

  # Load the library once here.
  ffi_lib [
    'libSDL3.so',       # Linux
    'SDL3.dll',         # Windows
    'libSDL3.dylib'     # macOS
  ]
end

# Basics
require_relative 'sdl3/basics/main'
require_relative 'sdl3/basics/init'

# Video
require_relative 'sdl3/video/video'
