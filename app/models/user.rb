# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  birthdate          :datetime
#  email              :string           not null
#  encrypted_password :string           not null
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  include Filterable::UserFilter

  devise :database_authenticatable

  has_many :tickets

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
