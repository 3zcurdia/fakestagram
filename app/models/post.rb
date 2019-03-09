# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :account, inverse_of: :posts
  validates :title, presence: true
end
