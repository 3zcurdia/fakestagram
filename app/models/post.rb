# frozen_string_literal: true

class Post < ApplicationRecord
  include AuthorData
  belongs_to :account, inverse_of: :posts
  has_many :likes, inverse_of: :post, dependent: :destroy
  has_many :comments, inverse_of: :post, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude, address: :location

  validates :title, presence: true
  after_validation :reverse_geocode, if: -> { latitude_changed? || longitude_changed? }

  has_one_attached :image

  default_scope { order(created_at: :desc) }

  def image_data=(base64_data)
    Base64File.new(base64_data) do |f|
      image.attach(filename: f.filename, io: f.io, content_type: f.content_type)
    end
  end

  def liked?(account)
    likes.from_account(account.id).exists?
  end
end
