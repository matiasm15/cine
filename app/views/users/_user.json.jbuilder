# frozen_string_literal: true

return json.nil! unless user

json.(
  user,
  :id,
  :name,
  :username,
  :created_at
)
