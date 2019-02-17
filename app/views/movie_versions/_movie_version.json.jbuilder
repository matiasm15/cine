# frozen_string_literal: true

json.(
  movie_version,
  :id,
  :title
)

json.language do
  json.partial! 'languages/language', language: movie_version.language
end

json.movie do
  json.partial! 'movies/movie', movie: movie_version.movie
end
