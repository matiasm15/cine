# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id          :bigint(8)        not null, primary key
#  closed_at   :datetime
#  reserved_at :datetime
#  status      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  function_id :bigint(8)
#  seat_id     :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_tickets_on_function_id  (function_id)
#  index_tickets_on_seat_id      (seat_id)
#  index_tickets_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (function_id => functions.id)
#  fk_rails_...  (seat_id => seats.id)
#  fk_rails_...  (user_id => users.id)
#

class Ticket < ApplicationRecord
  include Filterable::TicketFilter

  STATUSES = %w[
    created
    reserved
    closed
  ].freeze

  belongs_to :function
  belongs_to :seat
  belongs_to :user, optional: true

  enum status: STATUSES.to_h { |t| [t, t] }

  validates :status, presence: true

  validate :validate_seat_cinema

  before_validation :set_status, on: :create
  before_validation :set_dates

  private

  def set_status
    return if status?

    self.status = 'created'
  end

  def set_dates
    return unless status_changed?

    self["#{status}_at"] = Time.current
  end

  def validate_seat_cinema
    return if seat.blank?
    return if function.blank?
    return if seat.cinema_id == function.cinema_id

    errors.add(:seat, 'cinema and function cinema must be equals')
  end
end
