# frozen_string_literal: true

class CreateMessageReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :message_receivers do |t|
      t.integer :message_id, null: false
      t.integer :user_id, null: false

      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
