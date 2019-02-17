# frozen_string_literal: true

# == Schema Information
#
# Table name: languages
#
#  id          :bigint(8)        not null, primary key
#  code        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Language < ApplicationRecord
  include Filterable::LanguageFilter

  validates :code, presence: true
end
