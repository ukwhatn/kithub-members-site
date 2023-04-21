class CreateDiscordAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discord_accounts, id: false do |t|
      t.string :id, null: false, primary_key: true

      t.integer :user_id

      t.string :name
      t.string :discriminator

      t.string :avatar_url

      t.timestamps
    end
  end
end
