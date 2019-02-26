# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_ticket, only: %w[show update]

  def index
    @tickets = tickets.filter_by(filter_params)

    render :index
  end

  def show
    render @ticket
  end

  def update
    @ticket.user_id = current_user.id
    @ticket.update!(movie_params)

    show
  end

  private

  def tickets
    Ticket.where(
      'user_id = ? OR user_id IS NULL',
      current_user.id
    ).includes(
      :seat,
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

  def set_ticket
    @ticket = tickets.find(id)
  end

  def movie_params
    params.permit(
      :status
    )
  end

  def filter_params
    params.permit(
      :function_id,
      :user_id
    )
  end
end
