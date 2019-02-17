# frozen_string_literal: true

class ClassificationsController < ApplicationController
  before_action :set_classification, only: %w[show]

  def index
    @classifications = Classification.all

    render :index
  end

  def show
    render @classification
  end

  private

  def set_classification
    @classification = Classification.find(id)
  end
end
