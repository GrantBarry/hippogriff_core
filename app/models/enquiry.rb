class Enquiry < ApplicationRecord
  belongs_to :account
  belongs_to :agent, optional: true
  belongs_to :property, optional: true
  belongs_to :enquirer, class_name: 'Contact::Enquirer', optional: true, foreign_key: :contact_id

  validates :message, presence: true
  normalizes :message, with: ->(value) { value.strip }

  # validates :account_id, presence: true
  # validates :contact_id, presence: true

  accepts_nested_attributes_for :enquirer
end
