class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:properties)

    create_table :properties do |t|
      t.string :type, index: true
      t.belongs_to :agent, null: false, foreign_key: true, type: :uuid, index: true
      t.string :internal_id
      t.string :name
      t.string :building
      t.string :estate
      t.string :floor_level
      t.string :floor
      t.string :unit_suite_shop
      t.string :local_council
      t.string :land_area_description
      t.string :hard_stand_yard_description
      t.string :headline
      t.string :grabline
      t.string :keywords
      t.integer :parking_spaces
      t.string :parking_commentslifts_escalators_travelators
      t.string :clear_span_columns
      t.string :lot_number
      t.string :crane
      t.string :entrances_roller_doors_container_access
      t.string :zoning
      t.string :disability_access
      t.string :rating
      t.decimal :office_area, precision: 10, scale: 2
      t.decimal :warehouse_area, precision: 10, scale: 2
      t.decimal :showroom_area, precision: 10, scale: 2
      t.decimal :storage_area, precision: 10, scale: 2
      t.decimal :production_area, precision: 10, scale: 2
      t.decimal :trading_area, precision: 10, scale: 2
      t.decimal :floor_area, precision: 10, scale: 2
      t.decimal :land_area, precision: 10, scale: 2
      t.decimal :hard_stand_yard_area, precision: 10, scale: 2
      t.decimal :min_clearance_height, precision: 10, scale: 2
      t.decimal :max_clearance_height, precision: 10, scale: 2
      t.decimal :calculated_building_area
      t.boolean :share, default: false

      t.timestamps
    end
  end
end
