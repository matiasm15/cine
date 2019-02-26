# frozen_string_literal: true

return json.nil! unless user

json.(
  user,
  :id,
  :name,
  :created_at
)
