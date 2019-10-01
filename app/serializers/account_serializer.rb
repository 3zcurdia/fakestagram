# frozen_string_literal: true

class AccountSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :device_number, :device_model
  has_many :posts
  has_many :likes
end
