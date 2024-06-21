class WebsiteDomain < ApplicationRecord
  belongs_to :website

  validates :domain, presence: true, uniqueness: true
  normalizes :domain, with: ->(attribute) { attribute.strip.downcase }
end
