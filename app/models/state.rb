class State < ApplicationRecord
  belongs_to :country

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :country_id }
  normalizes :name, with: ->(value) { value.strip }

  normalizes :abbreviation, with: ->(value) { value.strip }

  has_many :cities, dependent: :delete_all
  has_many :districts, dependent: :delete_all
end
