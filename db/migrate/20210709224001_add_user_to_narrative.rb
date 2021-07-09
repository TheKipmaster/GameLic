class AddUserToNarrative < ActiveRecord::Migration[6.0]
  def change
    add_reference :narratives, :user, foreign_key: true
  end
end
