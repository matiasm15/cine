# frozen_string_literal: true

class FunctionsController < ApplicationController
  before_action :set_function, only: %w[show update destroy]

  def index
    @functions = functions.filter_by(filter_params)

    render :index
  end

  def show
    render @function
  end

  def create
    render Function.create!(function_params)
  end

  def update
    render @function.update!(function_params)
  end

  def destroy
    @function.destroy!

    head :no_content
  end

  private

  def functions
    Function.includes(
      :cinema,
      movie_version: [
        :language,
        movie: %w[
          classification
          genre
          language
        ]
      ]
    )
  end

  def set_function
    @function = functions.find(id)
  end

  def filter_params
    params.permit(
      :cinema_id,
      :movie_version_id
    )
  end

  def function_params
    params.permit(
      :started_for,
      :status,
      :cinema_id,
      :movie_version_id
    )
  end
end
