class Contract < ApplicationRecord
  attribute :eoi_minimum_price, :money

  belongs_to :property

  def for_sale?
    for_sale
  end

  def for_lease?
    for_lease
  end
end
