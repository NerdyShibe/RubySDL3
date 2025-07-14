# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'SDL3/SDL_video' do
  it_behaves_like 'check defined macros', 'SDL_video.h'
  it_behaves_like 'check defined enums', 'SDL_video.h'
end
