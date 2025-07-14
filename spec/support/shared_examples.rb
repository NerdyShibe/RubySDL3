# frozen_string_literal: true

RSpec.shared_examples 'check defined macros' do |header_file|
  all_c_macros = CHeaderParser.parse_macros(header_file)

  all_c_macros.each do |c_macro_name, c_macro_value|
    ruby_name = c_macro_name.strip_sdl

    it "correctly defines the constant: #{c_macro_name} as #{ruby_name}" do
      expect(SDL3.const_defined?(ruby_name)).to be true
    end

    next unless SDL3.const_defined?(ruby_name)

    it "correctly defines the value of: #{c_macro_name} as #{c_macro_value}" do
      expect(SDL3.const_get(ruby_name)).to eq(c_macro_value)
    end
  end
end

RSpec.shared_examples 'check defined enums' do |header_file|
  all_c_enums = CHeaderParser.parse_enums(header_file)

  all_c_enums.each do |c_enum_name, c_enum_members|
    # Converts from C naming convention to Ruby
    # 'SDL_AppResult' => :app_result
    ruby_enum_name = c_enum_name.strip_sdl.snakecase.to_sym

    it "correctly defines the enum: #{c_enum_name} as #{ruby_enum_name}" do
      expect(SDL3.enum_type(ruby_enum_name)).not_to be_nil
    end

    next if SDL3.enum_type(ruby_enum_name).nil?

    c_enum_members.each do |c_enum_member, c_enum_value|
      ruby_enum_member = SDL3.enum_type(ruby_enum_name)[c_enum_value]
      ruby_enum_value = SDL3.enum_type(ruby_enum_name)[ruby_enum_member]

      it "correctly defines the enum member: #{c_enum_member} as #{ruby_enum_member}" do
        expect(ruby_enum_member).to eq(c_enum_member.strip_sdl.downcase.to_sym)
      end

      it "correctly defines #{c_enum_member} value as: #{c_enum_value}" do
        expect(ruby_enum_value).to eq(c_enum_value)
      end
    end
  end
end
