# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :posts, inverse_of: :account
  validates :name, presence: true
end
