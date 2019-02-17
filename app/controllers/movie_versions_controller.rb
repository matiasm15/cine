# frozen_string_literal: true

class MovieVersionsController < ApplicationController
  before_action :set_movie_version, only: %w[show update destroy]

  def index
    @movie_versions = movie_versions.filter_by(filter_params)

    render :index
  end

  def show
    render @movie_version
  end

  def create
    render MovieVersion.create!(movie_version_params)
  end

  def update
    render @movie_version.update!(movie_version_params)
  end

  def destroy
    @movie_version.destroy!

    head :no_content
  end

  private

  def movie_versions
    MovieVersion.includes(
      :language,
      movie: %w[
        classification
        genre
        language
      ]
    )
  end

  def set_movie_version
    @movie_version = movie_versions.find(id)
  end

  def filter_params
    params.permit(
      :language_id,
      :movie_id
    )
  end

  def movie_version_params
    params.permit(
      :title,
      :language_id,
      :movie_id
    )
  end
end
