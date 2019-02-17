# frozen_string_literal: true

json.(
  ticket,
  :id,
  :closed_at,
  :reserved_at,
  :created_at
)

json.function do
  json.partial! 'functions/function', function: ticket.function
end

json.user do
  json.partial! 'users/user', user: ticket.user
end

json.seat do
  json.partial! 'seats/seat', seat: ticket.seat
end
