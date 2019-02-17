# frozen_string_literal: true
# == Schema Information
#
# Table name: genres
#
#  id          :bigint(8)        not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Genre < ApplicationRecord
  include Filterable::GenreFilter

  has_many :movies

  validates :description, presence: true
end
