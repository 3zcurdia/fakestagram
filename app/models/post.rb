# frozen_string_literal: true

class Post < ApplicationRecord
  include AuthorData
  belongs_to :account, inverse_of: :posts
  has_many :likes, inverse_of: :post, dependent: :destroy
  has_many :comments, inverse_of: :post, dependent: :destroy

  validates :title, presence: true

  has_one_attached :image

  default_scope { order(created_at: :desc) }

  def image_data=(base64_data)
    Base64File.new(base64_data) do |f|
      image.attach(filename: f.filename, io: f.io, content_type: f.content_type)
    end
  end

  def liked_by?(account)
    likes.where(account_id: account.id).exists?
  end
end
