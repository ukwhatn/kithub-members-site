class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.string :name_first_kana
      t.string :name_last_kana

      t.string :student_id

      t.integer :faculty_id # FK
      t.integer :department_id # FK

      t.integer :grade

      t.string :phone_number

      t.text :introduction, default: ''
      t.text :introduction_html, default: ''

      t.string :twitter_account_name

      t.boolean :can_publicize, default: false
      t.boolean :is_checked, default: false
      t.boolean :is_approved, default: false
      t.boolean :is_resigned, default: false

      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
