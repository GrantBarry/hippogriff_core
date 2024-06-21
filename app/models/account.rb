class Account < ApplicationRecord
  validates :company_name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :company_name, with: ->(value) { value.strip }

  validates :legal_name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :legal_name, with: ->(value) { value.strip }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  normalizes :email, with: ->(value) { value.strip }

  validates :phone, uniqueness: { case_sensitive: false }
  normalizes :phone, with: ->(value) { value.strip }

  validates :fax, uniqueness: { case_sensitive: false }
  normalizes :fax, with: ->(value) { value.strip }

  has_one :website, dependent: :destroy
  has_many :agents, dependent: :destroy
end
