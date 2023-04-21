class CreateSkillGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_genres do |t|
      t.string :name
      t.integer :position
      t.string :color
      t.timestamps
    end
  end
end
