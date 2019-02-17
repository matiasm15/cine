# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id                :bigint(8)        not null, primary key
#  duration          :integer
#  release_date      :datetime
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  classification_id :bigint(8)
#  genre_id          :bigint(8)
#  language_id       :bigint(8)
#
# Indexes
#
#  index_movies_on_classification_id  (classification_id)
#  index_movies_on_genre_id           (genre_id)
#  index_movies_on_language_id        (language_id)
#
# Foreign Keys
#
#  fk_rails_...  (classification_id => classifications.id)
#  fk_rails_...  (genre_id => genres.id)
#  fk_rails_...  (language_id => languages.id)
#

class Movie < ApplicationRecord
  include Filterable::MovieFilter

  belongs_to :classification
  belongs_to :genre
  belongs_to :language

  has_many :movie_versions

  validates :title, presence: true
end
