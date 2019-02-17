# frozen_string_literal: true

module Filterable
  module LanguageFilter
    extend ActiveSupport::Concern

    included do
      include Filterable
    end
  end
end
