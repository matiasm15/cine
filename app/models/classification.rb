# frozen_string_literal: true

# == Schema Information
#
# Table name: classifications
#
#  id          :bigint(8)        not null, primary key
#  code        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classification < ApplicationRecord
  include Filterable::ClassificationFilter

  has_many :movies

  validates :code, presence: true
end
