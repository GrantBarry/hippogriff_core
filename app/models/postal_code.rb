class PostalCode < ApplicationRecord
  belongs_to :city

  validates :postal_code, presence: true, uniqueness: { case_sensitive: false, scope: :city_id }
  normalizes :postal_code, with: ->(value) { value.strip }
end
