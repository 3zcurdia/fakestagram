# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy

  delegate :id, :name, :avatar_url, to: :user, allow_nil: true, prefix: true

  validates :title, presence: true

  default_scope { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  def image_data=(base64_data)
    self.image = Base64File.new(base64_data)
  end
end
