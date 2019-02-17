# frozen_string_literal: true

# == Schema Information
#
# Table name: movie_versions
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :bigint(8)
#  movie_id    :bigint(8)
#
# Indexes
#
#  index_movie_versions_on_language_id  (language_id)
#  index_movie_versions_on_movie_id     (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (language_id => languages.id)
#  fk_rails_...  (movie_id => movies.id)
#

class MovieVersion < ApplicationRecord
  include Filterable::MovieVersionFilter

  belongs_to :movie
  belongs_to :language

  has_many :functions
end
