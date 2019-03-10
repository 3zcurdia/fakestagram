# frozen_string_literal: true

json.array! @likes do |like|
  json.author do
    json.name = like.author_name
  end
  json.created_at like.created_at
  json.updated_at like.updated_at
end
