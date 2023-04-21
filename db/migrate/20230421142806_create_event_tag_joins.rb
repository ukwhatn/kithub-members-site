class CreateEventTagJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :event_tag_joins do |t|
      t.integer :event_id
      t.integer :event_tag_id
      t.timestamps
    end
  end
end
