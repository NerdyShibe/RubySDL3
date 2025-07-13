# frozen_string_literal: true

# Bindings for SDL_render.h
# Handles 2D Accelerated Rendering
#
module SDL3
  SOFTWARE_RENDERER = 'software'

  enum :texture_access, %i[
    static
    streaming
    target
  ]

  enum :texture_address_mode, [
    :invalid, -1,
    :auto,
    :clamp,
    :wrap
  ]

  enum :renderer_logical_presentation, %i[
    disabled
    stretch
    letterbox
    overscan
    integer_scale
  ]
end
