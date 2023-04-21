class CreateEventMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :event_members do |t|
      t.integer :user_id
      t.integer :event_time_frame_id
      t.boolean :attendance, default: nil
      t.timestamps
    end
  end
end
