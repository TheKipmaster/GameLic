class AddArchivedAtToNarratives < ActiveRecord::Migration[6.0]
  def change
    add_column :narratives, :archived_at, :timestamp
  end
end
