# frozen_string_literal: true

module SDL3
  # Wrapper for SDL_video.h
  # Handles Display and Window Management
  #
  module Video
    # --- Macros ---
    SDL_WINDOW_FULLSCREEN          = 0x00000001 # window is in fullscreen mode
    SDL_WINDOW_OPENGL              = 0x00000002 # window usable with OpenGL context
    SDL_WINDOW_OCCLUDED            = 0x00000004 # window is occluded
    SDL_WINDOW_HIDDEN              = 0x00000008 # window is neither mapped onto the desktop nor shown in the taskbar/dock/window list; SDL_ShowWindow() is required for it to become visible
    SDL_WINDOW_BORDERLESS          = 0x00000010 # no window decoration
    SDL_WINDOW_RESIZABLE           = 0x00000020 # window can be resized
    SDL_WINDOW_MINIMIZED           = 0x00000040 # window is minimized
    SDL_WINDOW_MAXIMIZED           = 0x00000080 # window is maximized
    SDL_WINDOW_MOUSE_GRABBED       = 0x00000100 # window has grabbed mouse input
    SDL_WINDOW_INPUT_FOCUS         = 0x00000200 # window has input focus
    SDL_WINDOW_MOUSE_FOCUS         = 0x00000400 # window has mouse focus
    SDL_WINDOW_EXTERNAL            = 0x00000800 # window not created by SDL
    SDL_WINDOW_MODAL               = 0x00001000 # window is modal
    SDL_WINDOW_HIGH_PIXEL_DENSITY  = 0x00002000 # window uses high pixel density back buffer if possible
    SDL_WINDOW_MOUSE_CAPTURE       = 0x00004000 # window has mouse captured (unrelated to MOUSE_GRABBED)
    SDL_WINDOW_MOUSE_RELATIVE_MODE = 0x00008000 # window has relative mode enabled
    SDL_WINDOW_ALWAYS_ON_TOP       = 0x00010000 # window should always be above others
    SDL_WINDOW_UTILITY             = 0x00020000 # window should be treated as a utility window, not showing in the task bar and window list
    SDL_WINDOW_TOOLTIP             = 0x00040000 # window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window
    SDL_WINDOW_POPUP_MENU          = 0x00080000 # window should be treated as a popup menu, requires a parent window
    SDL_WINDOW_KEYBOARD_GRABBED    = 0x00100000 # window has grabbed keyboard input
    SDL_WINDOW_VULKAN              = 0x10000000 # window usable for Vulkan surface
    SDL_WINDOW_METAL               = 0x20000000 # window usable for Metal view
    SDL_WINDOW_TRANSPARENT         = 0x40000000 # window with transparent buffer
    SDL_WINDOW_NOT_FOCUSABLE       = 0x80000000 # window should not be focusable

    # --- Function Attachments ---

    SDL3.attach_function :get_num_video_drivers, :SDL_GetNumVideoDrivers, [], :int
  end
end
