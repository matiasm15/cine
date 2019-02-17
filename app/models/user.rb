# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id            :bigint(8)        not null, primary key
#  birthdate     :datetime
#  email         :string           not null
#  name          :string
#  password_hash :string           not null
#  token         :string           not null
#  username      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
  include Filterable::UserFilter

  has_secure_token

  has_many :tickets

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    return unless valid_password?(new_password)

    @password = Password.create(new_password)

    self.password_hash = @password
  end
end
