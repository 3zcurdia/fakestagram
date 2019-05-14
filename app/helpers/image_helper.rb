# frozen_string_literal: true

module ImageHelper
  def source_image_url(image, size: nil)
    return unless image.attached?
    image.service_url
  end
end
