# frozen_string_literal: true

json.cache! account do
  json.id account.id
  json.name account.name
  json.avatar_url source_image_url(account.avatar)
  json.created_at account.created_at
  json.updated_at account.updated_at
end
