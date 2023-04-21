class CreateUserWorkPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :user_work_places do |t|
      t.integer :user_id
      t.integer :work_place_id

      t.timestamps
    end
  end
end
