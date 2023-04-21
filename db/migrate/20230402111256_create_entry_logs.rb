class CreateEntryLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_logs do |t|
      t.integer :user_id

      t.datetime :entry_at
      t.datetime :exit_at

      t.timestamps
    end
  end
end
