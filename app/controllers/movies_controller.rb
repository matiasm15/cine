# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %w[show update destroy]

  def index
    @movies = movies.filter_by(filter_params)

    render :index
  end

  def show
    render @movie
  end

  def create
    render Movie.create!(movie_params)
  end

  def update
    render @movie.update!(movie_params)
  end

  def destroy
    @movie.destroy!

    head :no_content
  end

  private

  def movies
    Movie.includes(
      :classification,
      :genre,
      :language
    )
  end

  def set_movie
    @movie = movies.find(id)
  end

  def filter_params
    params.permit(
      :genre_id,
      :language_id,
      :classification_id
    )
  end

  def movie_params
    params.permit(
      :title,
      :duration,
      :release_date,
      :genre_id,
      :language_id,
      :classification_id
    )
  end
end
