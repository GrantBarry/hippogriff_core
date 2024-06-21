class City < ApplicationRecord
  belongs_to :state
  belongs_to :district, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :state_id }
  normalizes :name, with: ->(value) { value.strip }

  normalizes :description, :keywords, with: ->(attribute) { attribute.strip.downcase }

  validates :slug, presence: true, uniqueness: true

  # has_many :postal_codes, dependent: :delete_all
end
