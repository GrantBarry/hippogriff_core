class Property < ApplicationRecord
  include MoneytaryAttributes
  include Archivable

  after_create_commit :generate_internal_id
  before_save :calculated_building_area

  belongs_to :agent
  belongs_to :city, optional: true
  belongs_to :postal_code, optional: true

  has_one :contract, dependent: :destroy
  has_many :property_usages, dependent: :delete_all

  has_many_attached :photos
  has_many_attached :files

  scope :latest_n, ->(n) { order(:updated_at).limit(n) }
  scope :for_sale,  -> { joins(:contract).where(contract: { for_sale:  true }) }
  scope :for_lease, -> { joins(:contract).where(contract: { for_lease: true }) }
  scope :available, -> { where(archived_at: nil).joins(:contract).where(contract: { for_sale:  true }).or(joins(:contract).where(contract: { for_lease: true })) }
  scope :commercial, -> { where(type: 'Property::Commercial') }
  scope :industrial, -> { where(type: 'Property::Industrial') }
  scope :retail,     -> { where(type: 'Property::Retail') }
  scope :residential, -> { where(type: 'Property::Residential') }

  monetary_attribute :naming_rights_cost

  delegate :account, to: :agent
  delegate :for_sale?, :for_lease?, to: :contract, allow_nil: true

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

  def address
    return nil if city.blank?

    # [street_address, city.name, city.state.name].compact_blank.join(', ')
    [city.name, city.state.name].compact_blank.join(', ')
  end

  private

  def generate_internal_id
    update_column(:internal_id, "#{account.company_name[0..2].upcase}-#{id}") if internal_id.blank?
  end

  def calculate_building_area
    self.calculated_building_area = building_area
  end
end
