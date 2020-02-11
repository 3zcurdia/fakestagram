# frozen_string_literal: true

json.id @post.id
json.title @post.title
json.image_url @post.image.url
json.image do
  json.small_url @post.image_url(:small)
  json.medium_url @post.image_url(:medium)
  json.large_url @post.image_url(:large)
end
json.comments_count @post.comments_count
json.user do
  json.id @post.user_id
  json.name @post.user_username
  json.avatar_url @post.user.avatar_url(:thumbnail)
end
json.created_at @post.created_at
json.updated_at @post.updated_at
