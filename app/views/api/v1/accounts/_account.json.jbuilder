# frozen_string_literal: true

json.id account.id
json.name account.name
json.avatar_url account.avatar_url(:small)
json.device_model account.device_model
json.created_at account.created_at
json.updated_at account.updated_at
