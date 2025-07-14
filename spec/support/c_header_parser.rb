# frozen_string_literal: true

module CHeaderParser
  SDL3_INCLUDE_PATH = '/usr/local/include/SDL3/'

  # Parses a C header file and extracts all #define constant definitions.
  #
  # @param header_file [String] The full path to the header file.
  # @return [Hash] A hash where keys are C constant names (e.g., "SDL_INIT_VIDEO")
  #   and values are their corresponding Ruby values (Integer, String, etc.).
  def self.parse_macros(header_file)
    content = File.read("#{SDL3_INCLUDE_PATH}#{header_file}")

    content.gsub!(%r{/\*.*?\*/}m, '')
    content.gsub!(%r{//.*$}, '')

    defines = {}
    # This regex finds lines starting with #define and captures the name and value.
    # It handles simple values (numbers, strings) and other constants.
    # It intentionally ignores function-like macros like #define MY_FUNC(x).
    # define_regex = /^\s*#define\s+([A-Z0-9_]+)\s+([^\(\n\r]+)/
    define_regex = /^\s*#define\s+([A-Z0-9_]+)\s+(.+)/

    content.scan(define_regex) do |match|
      name, value_str = match
      value_str.strip!

      if (match_data = value_str.match(/\((.*)\)/))
        value_str = match_data[1]
      end

      # Convert the C value string into an appropriate Ruby type.
      value = case value_str
              when /^0x[0-9a-fA-F]+/
                value_str.to_i(16)
              when /^-?\d+$/
                value_str.to_i # Decimal integer
              when /^"(.*)"$/
                ::Regexp.last_match(1)
              else
                # It might be another constant, keep it as a string for now.
                value_str
              end

      defines[name] = value
    end

    defines
  end

  # Parses a C header file and extracts all enum definitions.
  #
  # @param header_path [String] The full path to the header file.
  # @return [Hash] A hash where keys are C enum names (e.g., "SDL_AppResult")
  #   and values are hashes of their members (e.g., { continue: 0, success: 1 }).
  def self.parse_enums(header_file)
    content = File.read("#{SDL3_INCLUDE_PATH}#{header_file}")

    content.gsub!(%r{/\*.*?\*/}m, '')

    all_enums = {}

    # This regex finds all enum blocks and captures their name and body.
    # It handles both `enum MyEnum { ... }` and `typedef enum { ... } MyEnum;`
    enum_regex = /typedef\s+enum(?:\s+\w+)?\s*\{([^}]+)\}\s*(\w+);/m

    content.scan(enum_regex) do |match|
      enum_body, enum_name = match
      next unless enum_name && enum_body

      members = {}
      current_value = 0

      # Process the members inside the captured body.
      # We split by comma and strip whitespace to handle each member.
      enum_body.split(',').each do |line|
        # Use a regex to find the member name and its optional explicit value.
        member_match = line.match(/^\s*(\w+)(?:\s*=\s*(-?\d+))?/)
        next unless member_match

        member_name, explicit_value = member_match.captures

        current_value = explicit_value.to_i if explicit_value
        members[member_name] = current_value
        current_value += 1
      end
      all_enums[enum_name] = members
    end

    all_enums
  end
end
