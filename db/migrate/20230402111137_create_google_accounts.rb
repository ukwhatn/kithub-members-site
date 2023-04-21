class CreateGoogleAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :google_accounts, id: false do |t|
      t.string :id, null: false, primary_key: true

      t.string :name

      t.string :email

      t.string :avatar_url

      t.integer :user_id

      t.timestamps
    end
  end
end
