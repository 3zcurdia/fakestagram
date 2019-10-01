# frozen_string_literal: true

class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :likes_count, :comments_count, :created_at, :updated_at, :location
  belongs_to :account, lazy_load_data: true
  has_many :likes, lazy_load_data: true
  has_many :comments, lazy_load_data: true

  attribute :image_url do |object|
    object.image.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.image, host: ENV['HOST']) : nil
  end
end
