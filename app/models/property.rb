class Property < ApplicationRecord
  include MoneytaryAttributes

  after_create_commit :generate_internal_id
  before_save :calculated_building_area

  belongs_to :agent

  has_one :contract, dependent: :destroy
  has_many :property_usages, dependent: :delete_all

  scope :latest_n, ->(n) { order(:updated_at).limit(n) }
  scope :for_sale,  -> { joins(:contract).where(contract: { for_sale:  true }) }
  scope :for_lease, -> { joins(:contract).where(contract: { for_lease: true }) }

  monetary_attribute :naming_rights_cost

  delegate :account, to: :agent

  # Building area = all areas (except land_area and hard_stand_yard_area)
  def building_area
    building_area_attributes
      .map { |attr| public_send(attr) }
      .compact_blank
      .reduce(0.0, :+)
  end

  def total_area
    [building_area, land_area, hard_stand_yard_area]
      .compact_blank
      .reduce(0.0, :+)
  end

  private

  def generate_internal_id
    update_column(:internal_id, "#{account.company_name[0..2].upcase}-#{id}") if internal_id.blank?
  end

  def calculate_building_area
    self.calculated_building_area = building_area
  end
end
