class CreateEventGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :event_guests do |t|
      t.integer :event_time_frame_id

      t.string :name_first
      t.string :name_last
      t.string :name_first_kana
      t.string :name_last_kana
      t.string :student_id
      t.integer :grade

      t.integer :faculty_id # FK
      t.integer :department_id # FK

      t.boolean :attendance, default: nil

      t.timestamps
    end
  end
end
