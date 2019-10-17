# frozen_string_literal: true

class Post < ApplicationRecord
  include AuthorData
  belongs_to :account, inverse_of: :posts
  has_many :likes, inverse_of: :post, dependent: :destroy
  has_many :comments, inverse_of: :post, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude, address: :location

  validates :title, presence: true
  after_validation :reverse_geocode, if: -> { latitude_changed? || longitude_changed? }

  default_scope { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  def image_data=(base64_data)
    self.image = Base64File.new(base64_data)
  end

  def liked?(account)
    likes.from_account(account.id).exists?
  end
end
