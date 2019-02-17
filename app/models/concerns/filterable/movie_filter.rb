# frozen_string_literal: true

module Filterable
  module MovieFilter
    extend ActiveSupport::Concern

    included do
      include Filterable

      scope :genre_id, ->(genre_id) {
        where(genre_id: genre_id)
      }

      scope :language_id, ->(language_id) {
        where(language_id: language_id)
      }

      scope :classification_id, ->(classification_id) {
        where(classification_id: classification_id)
      }
    end
  end
end
