# frozen_string_literal: true

class LikeSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :post
  belongs_to :account
end
