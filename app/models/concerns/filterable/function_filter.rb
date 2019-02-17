# frozen_string_literal: true

module Filterable
  module FunctionFilter
    extend ActiveSupport::Concern

    included do
      include Filterable

      scope :cinema_id, ->(cinema_id) {
        where(cinema_id: cinema_id)
      }

      scope :movie_version_id, ->(movie_version_id) {
        where(movie_version_id: movie_version_id)
      }
    end
  end
end
