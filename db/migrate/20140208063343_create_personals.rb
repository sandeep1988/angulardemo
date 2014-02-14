class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.integer :age
      
      t.timestamps
    end
  end
end
