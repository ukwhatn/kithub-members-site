class CreateSkillGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_genres do |t|
      t.string :name, null: false
      t.integer :position, null: false
      t.string :color, null: false
      t.timestamps
    end
  end
end
