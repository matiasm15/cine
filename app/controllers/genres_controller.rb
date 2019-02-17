# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :set_genre, only: %w[show]

  def index
    @genres = Genre.all

    render :index
  end

  def show
    render @genre
  end

  private

  def set_genre
    @genre = Genre.find(id)
  end
end
