class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.text :description_for_attendees
      t.timestamps
    end
  end
end
