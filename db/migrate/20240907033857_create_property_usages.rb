class CreatePropertyUsages < ActiveRecord::Migration[7.2]
  def change
    return if table_exists?(:property_usages)

    create_table :property_usages do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.belongs_to :usage, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
