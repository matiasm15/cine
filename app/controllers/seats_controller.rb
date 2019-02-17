# frozen_string_literal: true

class SeatsController < ApplicationController
  def index
    @seats = Seat.filter_by(filter_params)

    render :index
  end

  private

  def filter_params
    params.permit(
      :cinema_id
    )
  end
end
