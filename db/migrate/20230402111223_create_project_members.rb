class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.integer :project_id
      t.integer :user_id

      t.boolean :is_owner, default: false
      t.boolean :is_checked, default: false
      t.boolean :is_approved, default: false
      t.boolean :is_resigned, default: false

      t.timestamps
    end
  end
end
