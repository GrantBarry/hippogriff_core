class Account < ApplicationRecord
  include Emailable

  validates :company_name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :company_name, with: ->(value) { value.strip }

  validates :legal_name, presence: true, uniqueness: { case_sensitive: false }
  normalizes :legal_name, with: ->(value) { value.strip }

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :phone, uniqueness: { case_sensitive: false }
  normalizes :phone, with: ->(value) { value.strip }

  validates :fax, uniqueness: { case_sensitive: false }
  normalizes :fax, with: ->(value) { value.strip }

  has_one :website, dependent: :destroy
  has_many :agents, dependent: :destroy
  has_many :properties, through: :agents
  has_many :commercial_properties,  through: :agents
  has_many :industrial_properties,  through: :agents
  has_many :residential_properties, through: :agents
  has_many :retail_properties,      through: :agents

  def website?
    website.present?
  end
end
