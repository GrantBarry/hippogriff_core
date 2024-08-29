class CreateCities < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:cities)

    create_table :cities, id: :uuid do |t|
      t.belongs_to :state, null: false, foreign_key: true, type: :uuid, index: true
      t.belongs_to :district, foreign_key: true, type: :uuid, index: true, null: true
      t.string :name, comment: 'City name'
      t.text :description, comment: 'City description, used on the website'

      t.timestamps
    end
  end
end
