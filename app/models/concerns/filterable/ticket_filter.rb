# frozen_string_literal: true

module Filterable
  module TicketFilter
    extend ActiveSupport::Concern

    included do
      include Filterable

      scope :function_id, ->(function_id) {
        where(function_id: function_id)
      }

      scope :user_id, ->(user_id) {
        where(user_id: user_id)
      }
    end
  end
end
