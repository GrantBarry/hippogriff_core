class Property < ApplicationRecord
  belongs_to :agent
  belongs_to :account, through: :agent
end
