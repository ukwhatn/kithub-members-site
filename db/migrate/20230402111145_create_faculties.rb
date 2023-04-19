# frozen_string_literal: true

class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
