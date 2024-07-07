class CreateEnquiries < ActiveRecord::Migration[7.1]
  def change
    create_table :enquiries, id: :uuid do |t|
      t.string     :type
      t.belongs_to :account,  null: false, foreign_key: true, type: :uuid
      t.belongs_to :agent,    null: true,  foreign_key: true, type: :uuid
      t.belongs_to :property, null: true,  foreign_key: true
      t.belongs_to :contact, null: true,   foreign_key: true, type: :uuid
      t.datetime   :enquired_at
      t.string     :message
      t.string     :source_enquiry_id
      t.string     :source_reference_id
    end
  end
end
