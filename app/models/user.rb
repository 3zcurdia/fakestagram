# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: :user

  validates :name, presence: true

  def avatar_url
    Faker::Avatar.image(slug: slug, size: "150x150", format: "jpg")
  end

  def slug
    @slug ||= name.downcase.tr('-')
  end
end
