class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :name
      t.integer :work_genre_id
      t.integer :user_id

      t.text :description, default: ''
      t.text :description_html, default: ''

      t.integer :project_id

      t.timestamps
    end
  end
end
