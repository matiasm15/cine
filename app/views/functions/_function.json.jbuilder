# frozen_string_literal: true

json.(
  function,
  :id,
  :finished_at,
  :started_at,
  :started_for,
  :status,
  :created_at
)

json.movie_version do
  json.partial! 'movie_versions/movie_version', movie_version: function.movie_version
end

json.cinema do
  json.partial! 'cinemas/cinema', cinema: function.cinema
end
