# frozen_string_literal: true

class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.integer :work_genre_id, null: false
      t.integer :user_id, null: false

      t.text :description, default: '', null: false
      t.text :description_html, default: '', null: false

      t.integer :project_id, null: true

      t.timestamps
    end
  end
end
