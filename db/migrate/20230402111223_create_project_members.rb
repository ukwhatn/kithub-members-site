# frozen_string_literal: true

class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.integer :project_id, null: false
      t.integer :user_id, null: false

      t.boolean :is_owner, null: false, default: false
      t.boolean :is_checked, null: false, default: false
      t.boolean :is_approved, null: false, default: false
      t.boolean :is_resigned, null: false, default: false

      t.timestamps
    end
  end
end
