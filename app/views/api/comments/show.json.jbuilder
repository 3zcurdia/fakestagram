json.author do
  json.name @comment.account.name
end
json.content @comment.content
json.created_at @comment.created_at
json.updated_at @comment.updated_at
