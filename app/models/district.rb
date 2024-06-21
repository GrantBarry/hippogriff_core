class District < ApplicationRecord
  belongs_to :state
  has_many :cities

  has_many :postal_codes, through: :cities

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :state_id }
  normalizes :name, with: ->(value) { value.strip }
end
