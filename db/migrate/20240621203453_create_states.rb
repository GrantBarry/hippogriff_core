class CreateStates < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:states)

    create_table :states, id: :uuid do |t|
      t.belongs_to :country, null: false, foreign_key: true, type: :uuid, index: true, comment: 'Country'
      t.string :name, null: false, comment: 'State name'
      t.string :abbreviation, null: false, comment: 'Local abbreviation'

      t.timestamps
    end
  end
end
