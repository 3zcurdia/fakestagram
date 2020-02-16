# frozen_string_literal: true

namespace :rgeo do
  desc 'Check if RGeo supports GEOS'
  task :support do
    abort 'Error: RGeo does not support GEOS.' unless RGeo::Geos.supported?
  end
end
