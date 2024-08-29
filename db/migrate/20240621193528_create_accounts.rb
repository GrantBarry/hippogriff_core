class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:accounts)

    create_table :accounts, id: :uuid do |t|
      t.string :company_name, null: false
      t.string :legal_name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
