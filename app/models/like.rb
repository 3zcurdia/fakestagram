# frozen_string_literal: true

class Like < ApplicationRecord
  include AuthorData
  belongs_to :post, inverse_of: :likes
  belongs_to :account, inverse_of: :likes
end
