# frozen_string_literal: true

module Filterable
  module MovieVersionFilter
    extend ActiveSupport::Concern

    included do
      include Filterable

      scope :language_id, ->(language_id) {
        where(language_id: language_id)
      }

      scope :movie_id, ->(movie_id) {
        where(movie_id: movie_id)
      }
    end
  end
end
