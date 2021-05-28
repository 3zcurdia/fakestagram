# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  public_key      :string
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  has_many :posts, inverse_of: :user, dependent: :destroy

  validates :username, presence: true

  def avatar_url
    Faker::Avatar.image(slug: username, size: '150x150', format: 'jpg')
  end

  def token
    Token.encode(
      exp: Time.now.to_i + 86_400,
      iat: Time.now.to_i,
      sub: id,
      iss: 'secretly',
      user: {
        username: username
      }
    )
  end
end
