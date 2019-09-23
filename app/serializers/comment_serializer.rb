class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content
  belongs_to :post
  belongs_to :account
end
