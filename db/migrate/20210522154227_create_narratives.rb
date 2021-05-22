class CreateNarratives < ActiveRecord::Migration[6.0]
  def change
    create_table :narratives do |t|
      t.string :title
      t.string :author
      t.string :story

      t.timestamps
    end
  end
end
