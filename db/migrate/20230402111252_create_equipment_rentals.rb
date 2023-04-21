class CreateEquipmentRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_rentals do |t|
      t.integer :user_id
      t.integer :equipment_id

      t.datetime :rental_start
      t.datetime :rental_end

      t.timestamps
    end
  end
end
