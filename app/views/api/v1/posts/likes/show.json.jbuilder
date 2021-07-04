# frozen_string_literal: true

json.id @like.id
json.likeable_id @like.likeable_id
json.likeable_type @like.likeable_type
json.user do
  json.id @like.user_id
  json.username @like.user.username
  json.avatar_url @like.user.avatar_url
end
json.created_at @like.created_at.iso8601
json.updated_at @like.updated_at.iso8601
