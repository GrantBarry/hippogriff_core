class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities, id: :uuid do |t|
      t.belongs_to :state, null: false, foreign_key: true, type: :uuid, index: true
      t.belongs_to :district, foreign_key: true, type: :uuid, index: true, null: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
