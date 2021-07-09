class CorrectNarratives < ActiveRecord::Migration[6.0]
  def change
    change_table :narratives do |t|
      t.remove :author, :story
      t.text :description
      t.integer :size
    end
  end
end
