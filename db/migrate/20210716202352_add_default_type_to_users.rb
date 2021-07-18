class AddDefaultTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :type, :string, :default => "Student"
  end
end
