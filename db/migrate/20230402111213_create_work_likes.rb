class CreateWorkLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :work_likes do |t|

      t.integer :user_id
      t.integer :work_id

      t.timestamps
    end
  end
end
