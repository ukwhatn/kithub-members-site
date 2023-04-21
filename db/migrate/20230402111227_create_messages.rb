class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :subject, default: ''
      t.text :body, default: ''
      t.text :body_html, default: ''

      t.integer :sender_id

      t.boolean :for_everyone, default: false

      t.timestamps
    end
  end
end
