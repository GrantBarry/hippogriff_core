class Property < ApplicationRecord
  belongs_to :agent

  scope :latest_n, ->(n) { order(:updated_at).limit(n) }
end
