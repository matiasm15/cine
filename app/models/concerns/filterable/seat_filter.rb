# frozen_string_literal: true

module Filterable
  module SeatFilter
    extend ActiveSupport::Concern

    included do
      include Filterable

      scope :cinema_id, ->(cinema_id) {
        where(cinema_id: cinema_id)
      }
    end
  end
end
