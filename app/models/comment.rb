# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post, inverse_of: :comments, counter_cache: true
  belongs_to :user

  delegate :id, :username, :avatar_url, to: :user, allow_nil: true, prefix: true

  validates :content, presence: true, length: { minimum: 4 }
end
