class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :type
      t.belongs_to :agent, null: false, foreign_key: true, type: :uuid
      t.belongs_to :account, null: false, foreign_key: true, type: :uuid
      t.boolean :share, default: false
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :legal_name
      t.string :job_title
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :url
      t.string :registration
      t.string :source_id
      t.uuid :business_id, default: nil

      t.timestamps
    end
  end
end
