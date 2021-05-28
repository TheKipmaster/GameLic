class AddNarrativeToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :narrative, foreign_key: true
  end
end
