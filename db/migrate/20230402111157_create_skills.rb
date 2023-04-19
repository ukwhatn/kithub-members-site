class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :skill_genre_id, null: false

      t.timestamps
    end
  end
end
