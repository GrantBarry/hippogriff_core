class CreateUsages < ActiveRecord::Migration[7.2]
  def change
    return if table_exists?(:usages)

    create_table :usages, id: :uuid do |t|
      t.string :name, null: false
    end
  end
end
