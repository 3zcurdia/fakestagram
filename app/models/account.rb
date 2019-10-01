# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :posts, inverse_of: :account
  has_many :likes, inverse_of: :account

  validates :name, presence: true

  has_one_attached :avatar

  def avatar_data=(base64_data)
    Base64File.new(base64_data) do |f|
      avatar.attach(filename: f.filename, io: f.io, content_type: f.content_type)
    end
  end
end
