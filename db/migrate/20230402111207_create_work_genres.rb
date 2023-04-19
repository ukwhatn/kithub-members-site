# frozen_string_literal: true

class CreateWorkGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :work_genres do |t|
      t.string :name, null: false
      t.integer :position, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
