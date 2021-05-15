class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :institution
      t.string :registration_number
      t.string :nickname
      t.integer :age

      t.timestamps
    end
  end
end
