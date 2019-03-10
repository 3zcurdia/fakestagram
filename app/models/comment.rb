# frozen_string_literal: true

class Comment < ApplicationRecord
  include AuthorData
  belongs_to :post, inverse_of: :comments, counter_cache: true
  belongs_to :account

  validates :content, presence: true, length: { minimum: 4 }
end
