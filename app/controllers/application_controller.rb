# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandlingConcern

  def id
    params[:id]
  end
end
