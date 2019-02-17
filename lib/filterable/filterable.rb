# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_by(filters)
      filters.to_h.inject(all) do |chain, (key, value)|
        chain.public_send(key, value)
      end
    end
  end
end
