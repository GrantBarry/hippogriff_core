class CreateWebsites < ActiveRecord::Migration[7.1]
  def change
    create_table :websites do |t|
      t.belongs_to :account, null: false, foreign_key: true
      t.string :description, null: false
      t.string :title, null: false
      t.string :keywords, null: false
      t.string :enquiry_email, null: false
      t.string :enquiry_phone

      t.timestamps
    end
  end
end
