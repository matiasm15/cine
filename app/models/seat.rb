# frozen_string_literal: true

# == Schema Information
#
# Table name: seats
#
#  id         :bigint(8)        not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cinema_id  :bigint(8)
#
# Indexes
#
#  index_seats_on_cinema_id  (cinema_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#

class Seat < ApplicationRecord
  include Filterable::SeatFilter

  belongs_to :cinema

  has_many :tickets
end
