class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  belongs_to :account

  enum role: %i[agent admin account_manager]

  validates :first_name, :last_name, presence: true
  normalizes :first_name, :last_name, with: ->(value) { value.strip }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  normalizes :email, with: ->(value) { value.downcase.strip }

  validates :mobile, :phone, :fax, uniqueness: { case_sensitive: false }
  normalizes :mobile, :phone, :fax, with: ->(value) { value.strip }

  has_many :properties, dependent: :delete_all
end
