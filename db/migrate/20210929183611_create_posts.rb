class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.boolean :allow, :default => true
      t.belongs_to :user
      t.belongs_to :narrative

      t.timestamps
    end
  end
end
