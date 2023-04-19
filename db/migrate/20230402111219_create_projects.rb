class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|

      t.string :name, null: false
      t.text :description, null: false
      t.text :description_html, null: false

      t.text :description_for_members, null: true
      t.text :description_for_members_html, null: true

      t.timestamps
    end
  end
end
