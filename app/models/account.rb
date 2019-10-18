# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :posts, inverse_of: :account
  has_many :likes, inverse_of: :account

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader

  def avatar_data=(base64_data)
    self.avatar = Base64File.new(base64_data)
  end
end
