# frozen_string_literal: true

class CreateGithubAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :github_accounts, id: false do |t|
      t.string :id, null: false, primary_key: true

      t.string :name, null: false # login想定

      t.string :avatar_url, null: true

      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
