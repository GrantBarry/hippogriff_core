class CreatePostalCodes < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:postal_codes)

    create_table :postal_codes, id: :uuid do |t|
      t.belongs_to :city, null: false, foreign_key: true, type: :uuid, index: true
      t.string :postal_code

      t.timestamps
    end
  end
end
