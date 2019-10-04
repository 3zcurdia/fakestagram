# frozen_string_literal: true

json.array! @comments do |comment|
  json.id comment.id
  json.author do
    json.id comment.author_id
    json.name comment.author_name
    json.avatar_url source_image_url(comment.account.avatar)
  end
  json.content comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
end
