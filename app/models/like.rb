# frozen_string_literal: true

class Like < ApplicationRecord
  include AuthorData
  belongs_to :post, inverse_of: :likes, counter_cache: true
  belongs_to :account, inverse_of: :likes
end
