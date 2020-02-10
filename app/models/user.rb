# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  validates :name, presence: true

  def avatar_url
    'https://via.placeholder.com/150.png'
  end
end
