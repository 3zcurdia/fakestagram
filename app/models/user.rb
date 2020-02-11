# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts, inverse_of: :user

  validates :username, presence: true

  def avatar_url
    Faker::Avatar.image(slug: username, size: '150x150', format: 'jpg')
  end

  def token
    Token.encode(
      sub: id,
      username: username,
      iat: Time.zone.now.utc
    )
  end
end
