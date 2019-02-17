# frozen_string_literal: true

class LanguagesController < ApplicationController
  before_action :set_language, only: %w[show]

  def index
    @languages = Language.all

    render :index
  end

  def show
    render @language
  end

  private

  def set_language
    @language = Language.find(id)
  end
end
