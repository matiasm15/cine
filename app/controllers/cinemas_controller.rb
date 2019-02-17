# frozen_string_literal: true

class CinemasController < ApplicationController
  before_action :set_cinema, only: %w[show]

  def index
    @cinemas = Cinema.all

    render :index
  end

  def show
    render @cinema
  end

  private

  def set_cinema
    @cinema = Cinema.find(id)
  end
end
