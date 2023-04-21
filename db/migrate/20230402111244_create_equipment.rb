class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name

      t.text :description, default: ''

      t.timestamps
    end
  end
end
