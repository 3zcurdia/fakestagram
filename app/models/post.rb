# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :account, inverse_of: :posts
  has_many :likes, inverse_of: :posts
  has_many :comments, inverse_of: :posts

  validates :title, presence: true

  default_scope { order(created_at: :desc) }
end
