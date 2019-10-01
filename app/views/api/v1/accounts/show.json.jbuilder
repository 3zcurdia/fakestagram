json.id @account.id
json.name @account.name
json.device_number @account.device_number
json.device_model @account.device_model
json.avatar_url source_image_url(@account.avatar)
json.created_at @account.created_at
json.updated_at @account.updated_at
