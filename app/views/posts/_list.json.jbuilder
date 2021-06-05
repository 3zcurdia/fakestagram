# frozen_string_literal: true

json.array! posts do |post|
  json.id post.id
  json.content post.content
  json.background_color post.background_color
  json.image do
    json.small_url post.image_url(:small)
    json.medium_url post.image_url(:medium)
  end if image.present?
  json.comments_count post.comments_count
  json.user do
    json.id post.user_id
    json.username post.user_username
    json.avatar_url post.user.avatar_url
  end
  json.created_at post.created_at.iso8601
  json.updated_at post.updated_at.iso8601
end
