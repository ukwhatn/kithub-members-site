class CreateEquipmentRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_rentals do |t|
      t.integer :user_id, null: false
      t.integer :equipment_id, null: false

      t.datetime :rental_start, null: false
      t.datetime :rental_end, null: true

      t.timestamps
    end
  end
end
