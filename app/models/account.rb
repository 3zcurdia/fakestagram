# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :posts, inverse_of: :account
  has_many :likes, inverse_of: :account

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
