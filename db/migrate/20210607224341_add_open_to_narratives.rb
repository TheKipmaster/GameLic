class AddOpenToNarratives < ActiveRecord::Migration[6.0]
  def change
    add_column :narratives, :open, :bool, :default => false
  end
end
