class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :skill_genre_id

      t.timestamps
    end
  end
end
