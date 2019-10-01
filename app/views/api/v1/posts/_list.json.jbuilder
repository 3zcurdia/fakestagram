# frozen_string_literal: true

json.array! posts do |post|
  # json.cache! post do
    json.id post.id
    json.title post.title
    json.location post.location
    json.image_url source_image_url(post.image)
    json.likes_count post.likes_count
    json.comments_count post.comments_count
    json.liked liked_posts.include?(post.id)
    json.author do
      json.id post.author_id
      json.name post.author_name
    end
    json.created_at post.created_at
    json.updated_at post.updated_at
  # end
end
