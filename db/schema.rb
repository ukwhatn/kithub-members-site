# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_402_132_250) do
  create_table 'departments', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'faculty_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'discord_accounts', id: :string, charset: 'utf8mb4', collation: 'utf8mb4_general_ci',
                                   force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'name', null: false
    t.string 'discriminator', null: false
    t.string 'avatar_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'entry_logs', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.datetime 'entry_at', null: false
    t.datetime 'exit_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'equipment', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'description_html', default: '', null: false
  end

  create_table 'equipment_rentals', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'equipment_id', null: false
    t.datetime 'rental_start', null: false
    t.datetime 'rental_end'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'faculties', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'github_accounts', id: :string, charset: 'utf8mb4', collation: 'utf8mb4_general_ci',
                                  force: :cascade do |t|
    t.string 'name', null: false
    t.string 'avatar_url'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'google_accounts', id: :string, charset: 'utf8mb4', collation: 'utf8mb4_general_ci',
                                  force: :cascade do |t|
    t.string 'name', null: false
    t.string 'avatar_url'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'message_receivers', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'message_id', null: false
    t.integer 'user_id', null: false
    t.boolean 'read', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'messages', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'subject', default: '', null: false
    t.text 'body', default: '', null: false
    t.text 'body_html', default: '', null: false
    t.integer 'sender_id', null: false
    t.boolean 'for_everyone', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'project_members', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'project_id', null: false
    t.integer 'user_id', null: false
    t.boolean 'is_owner', default: false, null: false
    t.boolean 'is_checked', default: false, null: false
    t.boolean 'is_approved', default: false, null: false
    t.boolean 'is_resigned', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'projects', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.text 'description_html', null: false
    t.text 'description_for_members'
    t.text 'description_for_members_html'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'skill_genres', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'position', null: false
    t.string 'color', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'skills', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'skill_genre_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_skills', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'skill_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'kindai_email'
    t.string 'name_first', null: false
    t.string 'name_last', null: false
    t.string 'name_first_kana', null: false
    t.string 'name_last_kana', null: false
    t.string 'student_id'
    t.integer 'faculty_id'
    t.integer 'department_id'
    t.integer 'grade', null: false
    t.string 'phone_number', null: false
    t.text 'introduction', default: '', null: false
    t.text 'introduction_html', default: '', null: false
    t.string 'twitter_account_name'
    t.boolean 'can_publicize', default: false, null: false
    t.boolean 'is_checked', default: false, null: false
    t.boolean 'is_approved', default: false, null: false
    t.boolean 'is_resigned', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'work_genres', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'position', null: false
    t.string 'color', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'work_likes', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'work_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'works', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'work_genre_id', null: false
    t.integer 'user_id', null: false
    t.text 'description', default: '', null: false
    t.text 'description_html', default: '', null: false
    t.integer 'project_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
