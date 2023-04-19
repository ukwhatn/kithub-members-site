class CreateUserSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :user_skills do |t|
      t.integer :user_id, null: false
      t.integer :skill_id, null: false

      t.timestamps
    end
  end
end
