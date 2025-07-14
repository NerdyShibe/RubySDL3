# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'SDL3/SDL_init' do
  it_behaves_like 'check defined macros', 'SDL_init.h'
  it_behaves_like 'check defined enums', 'SDL_init.h'
end
