class CreateWebsiteDomains < ActiveRecord::Migration[7.1]
  def change
    create_table :website_domains, id: :uuid do |t|
      t.belongs_to :website, null: false, foreign_key: true, type: :uuid
      t.string :domain, null: false

      t.timestamps
    end
  end
end
