class Enquiry < ApplicationRecord
  include Nameable

  belongs_to :account
  belongs_to :agent, optional: true
  belongs_to :property, optional: true

  normalizes :company_name, :mobile, with: ->(value) { value.strip }

  validates :message, presence: true
  normalizes :message, with: ->(value) { value.strip }
end
