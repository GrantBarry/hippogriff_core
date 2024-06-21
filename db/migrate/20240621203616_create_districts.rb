class CreateDistricts < ActiveRecord::Migration[7.1]
  def change
    create_table :districts, id: :uuid do |t|
      t.belongs_to :state, null: false, foreign_key: true, type: :uuid, index: true, comment: 'State'
      t.string :name, null: false, comment: 'District name'

      t.timestamps
    end
  end
end
