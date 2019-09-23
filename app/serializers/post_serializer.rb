class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :likes_count, :comments_count, :created_at, :updated_at, :location
  belongs_to :account
  has_many :likes
  has_many :comments
end
