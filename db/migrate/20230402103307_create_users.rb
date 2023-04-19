class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :kindai_email

      t.string :name_first, null: false
      t.string :name_last, null: false
      t.string :name_first_kana, null: false
      t.string :name_last_kana, null: false

      t.string :student_id

      t.integer :faculty_id # FK
      t.integer :department_id # FK

      t.integer :grade, null: false

      t.string :phone_number, null: false

      t.text :introduction, default: '', null: false
      t.text :introduction_html, default: '', null: false

      t.string :twitter_account_name

      t.boolean :can_publicize, default: false, null: false
      t.boolean :is_checked, default: false, null: false
      t.boolean :is_approved, default: false, null: false
      t.boolean :is_resigned, default: false, null: false

      t.timestamps
    end
  end
end
