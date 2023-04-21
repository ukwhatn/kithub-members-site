class CreateEventTimeFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :event_time_frames do |t|
      t.integer :event_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :capacity
      t.timestamps
    end
  end
end
