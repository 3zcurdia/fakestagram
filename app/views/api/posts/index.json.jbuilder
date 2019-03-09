# frozen_string_literal: true

json.array! @posts do |post|
  json.title post.title
  json.image_url url_for(post.image)
  json.likes_count post.likes_count
  json.comments_count post.comments_count
  json.created_at post.created_at
  json.updated_at post.updated_at
end
