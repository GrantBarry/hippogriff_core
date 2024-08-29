class CreateContracts < ActiveRecord::Migration[7.2]
  def change
    return if table_exists?(:contracts)

    create_table :contracts, id: :uuid do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.date :eoi_close_on
      t.date :eoi_inspection_on
      t.bigint :eoi_minimum_price_cents
      t.bigint :eoi_target_price_cents
      t.boolean :for_lease
      t.boolean :for_sale
      t.bigint :lease_cleaning_cents
      t.date :lease_commencement_on
      t.bigint :lease_covered_parking_sapce_cents
      t.string :lease_escalation_formulae
      t.text :lease_escalation_rate
      t.date :lease_expires_on
      t.decimal :lease_gross_rent
      t.decimal :lease_net_rent
      t.bigint :lease_on_grade_parking_space_cents
      t.bigint :lease_other_rental_costs_cents
      t.decimal :lease_outgoings
      t.date :lease_rent_review_on
      t.string :lease_term
      t.bigint :private_treaty_minimum_price_cents
      t.bigint :private_treaty_target_price_cents
      t.bigint :sale_actual_sale_price_cents
      t.date :sale_auction_on
      t.string :sale_auction_venue
      t.date :sale_inspection_on
      t.bigint :sale_price_cents
      t.bigint :sale_price_from_cents
      t.bigint :sale_price_to_cents
      t.bigint :sale_reserve_price_cents

      t.timestamps
    end
  end
end
