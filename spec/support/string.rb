# frozen_string_literal: true

class String
  def strip_sdl
    gsub('sdl_', '').gsub('SDL_', '')
  end

  # Converts a string from CamelCase or PascalCase to snake_case
  #
  # Examples:
  #   "MyClassName".snake_case #=> "my_class_name"
  #   "SDLAppResult".snake_case #=> "sdl_app_result"
  #
  def snakecase
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end
end
