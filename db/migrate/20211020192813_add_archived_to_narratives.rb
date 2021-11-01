class AddArchivedToNarratives < ActiveRecord::Migration[6.0]
  def change
    add_column :narratives, :archived, :bool, default: false
  end
end
