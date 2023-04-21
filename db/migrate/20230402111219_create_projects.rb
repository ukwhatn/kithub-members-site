class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :description_html

      t.text :description_for_members
      t.text :description_for_members_html

      t.timestamps
    end
  end
end
