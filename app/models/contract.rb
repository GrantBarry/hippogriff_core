class Contract < ApplicationRecord
  attribute :eoi_minimum_price, :money

  belongs_to :property
end
