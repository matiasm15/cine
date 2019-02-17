# frozen_string_literal: true

json.(
  movie,
  :id,
  :title,
  :duration,
  :release_date
)

json.classification do
  json.partial! 'classifications/classification', classification: movie.classification
end

json.genre do
  json.partial! 'genres/genre', genre: movie.genre
end

json.language do
  json.partial! 'languages/language', language: movie.language
end
