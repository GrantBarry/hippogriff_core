class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :name, with: ->(value) { value.strip }

  validates :code, presence: true, uniqueness: true, length: { is: 2 }
  normalizes :code, with: ->(value) { value.strip.downcase }

  has_many :states, dependent: :destroy

  # has_many :cities,    through: :states
  has_many :districts, through: :states
end
