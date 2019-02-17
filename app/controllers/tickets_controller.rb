# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_movie, only: %w[show update]

  def index
    @tickets = tickets.filter_by(filter_params)

    render :index
  end

  def show
    render @ticket
  end

  def update
    render @ticket.update!(movie_params)
  end

  private

  def tickets
    Ticket.includes(
      :seat,
      :user,
      function: [
        :cinema,
        movie_version: [
          :language,
          movie: %w[
            classification
            genre
            language
          ]
        ]
      ]
    )
  end

  def set_movie
    @ticket = movies.find(id)
  end

  def movie_params
    params.permit(
      :status,
      :user_id
    )
  end

  def filter_params
    params.permit(,
      :function_id,
      :user_id
    )
  end
end
