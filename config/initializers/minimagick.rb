# frozen_string_literal: true

module CarrierWave
  module MiniMagick
    def blur(radius)
      manipulate! do |img|
        img.blur(radius.to_s)
        img = yield(img) if block_given?
        img
      end
    end

    def gaussian_blur(radius)
      manipulate! do |img|
        img.gaussian_blur(radius.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
