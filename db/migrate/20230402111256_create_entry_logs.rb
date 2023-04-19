# frozen_string_literal: true

class CreateEntryLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_logs do |t|
      t.integer :user_id, null: false

      t.datetime :entry_at, null: false
      t.datetime :exit_at, null: true

      t.timestamps
    end
  end
end
