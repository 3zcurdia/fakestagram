# frozen_string_literal: true

json.author do
  json.id @like.author_id
  json.name @like.author_name
  json.avatar_url @like.account.avatar.url
end
json.created_at @like.created_at
json.updated_at @like.updated_at
