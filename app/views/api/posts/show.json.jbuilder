# frozen_string_literal: true

json.id @post.id
json.title @post.title
json.image_url @post.image.attached? ? rails_blob_url(@post.image) : nil
json.likes_count @post.likes_count
json.comments_count @post.comments_count
json.author do
  json.name @post.author_name
end
json.created_at @post.created_at
json.updated_at @post.updated_at
