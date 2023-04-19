class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name, null: false

      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end
