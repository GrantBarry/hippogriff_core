class AddCityToProperties < ActiveRecord::Migration[7.2]
  def change
    add_reference :properties, :city, null: true, foreign_key: true, type: :uuid
    add_reference :properties, :postal_code, null: true, foreign_key: true, type: :uuid
  end
end
