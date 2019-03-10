# frozen_string_literal: true

json.array! @comments do |comment|
  json.id comment.id
  json.author do
    json.name comment.author_name
  end
  json.content comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
end
