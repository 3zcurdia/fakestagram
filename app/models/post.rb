# frozen_string_literal: true

class Post < ApplicationRecord
  include UserData
  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy

  validates :title, presence: true

  default_scope { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  def image_data=(base64_data)
    self.image = Base64File.new(base64_data)
  end
end
