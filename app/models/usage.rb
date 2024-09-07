class Usage < ApplicationRecord
  validates :name, presence: true
  normalizes :name, with: ->(value) { value.strip }

  has_many :properties
end
