class Agent < ApplicationRecord
  include Role
  include Emailable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  belongs_to :account

  validates :first_name, :last_name, presence: true
  normalizes :first_name, :last_name, with: ->(value) { value.strip }

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :mobile, :phone, :fax, uniqueness: { case_sensitive: false }
  normalizes :mobile, :phone, :fax, with: ->(value) { value.strip }

  has_many :properties,             dependent: :destroy
  has_many :retail_properties,      dependent: :destroy, class_name: 'Property::Retail'
  has_many :industrial_properties,  dependent: :destroy, class_name: 'Property::Industrial'
  has_many :commercial_properties,  dependent: :destroy, class_name: 'Property::Commercial'
  has_many :residential_properties, dependent: :destroy, class_name: 'Property::Residential'

  has_person_name
end
