# frozen_string_literal: true

module ImageHelper
  def source_image_url(image, size: nil)
    return unless image.attached?

    rails_blob_url(image)
  end
end
