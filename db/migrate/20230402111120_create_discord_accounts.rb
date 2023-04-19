class CreateDiscordAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discord_accounts, id: false do |t|
      t.string :id, null: false, primary_key: true

      t.integer :user_id, null: false

      t.string :name, null: false
      t.string :discriminator, null: false

      t.string :avatar_url, null: true

      t.timestamps
    end
  end
end
