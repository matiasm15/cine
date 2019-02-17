# frozen_string_literal: true

# == Schema Information
#
# Table name: cinemas
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cinema < ApplicationRecord
  include Filterable::CinemaFilter

  has_many :functions
  has_many :seats

  validates :description, presence: true
end
