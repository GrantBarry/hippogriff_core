class AddArchivedAtToProperties < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :archived_at, :datetime, default: nil
  end
end
