class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :subject, null: false, default: ''
      t.text :body, null: false, default: ''
      t.text :body_html, null: false, default: ''

      t.integer :sender_id, null: false

      t.boolean :for_everyone, null: false, default: false

      t.timestamps
    end
  end
end
