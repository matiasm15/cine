# frozen_string_literal: true

# == Schema Information
#
# Table name: functions
#
#  id               :bigint(8)        not null, primary key
#  finished_at      :datetime
#  started_at       :datetime
#  started_for      :datetime         not null
#  status           :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cinema_id        :bigint(8)
#  movie_version_id :bigint(8)
#
# Indexes
#
#  index_functions_on_cinema_id         (cinema_id)
#  index_functions_on_movie_version_id  (movie_version_id)
#
# Foreign Keys
#
#  fk_rails_...  (cinema_id => cinemas.id)
#  fk_rails_...  (movie_version_id => movie_versions.id)
#

class Function < ApplicationRecord
  include Filterable::FunctionFilter

  STATUSES = %w[
    created
    started
    finished
  ].freeze

  belongs_to :cinema
  belongs_to :movie_version

  has_many :tickets

  enum status: STATUSES.to_h { |t| [t, t] }

  validates :status, presence: true
  validates :started_for, presence: true

  validate :validate_start_date_must_be_in_future

  before_validation :set_status, on: :create
  before_validation :set_dates

  after_create_commit :create_tickets!

  private

  def validate_start_date_must_be_in_future
    return unless started_for?
    return if started_for.blank?
    return if started_for > Time.current.beginning_of_day

    errors.add(:started_for, 'must be in future')
  end

  def set_status
    return if status?

    self.status = 'created'
  end

  def set_dates
    return unless status_changed?

    self["#{status}_at"] = Time.current
  end

  def create_tickets!
    cinema.seats.find_each do |seat|
      tickets.create!(seat: seat)
    end
  end
end
