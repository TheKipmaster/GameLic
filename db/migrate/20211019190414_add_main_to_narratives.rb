class AddMainToNarratives < ActiveRecord::Migration[6.0]
  def change
    add_column :narratives, :main_forum, :bool, default: false
  end
end
