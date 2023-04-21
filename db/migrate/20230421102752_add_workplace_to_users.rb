class AddWorkplaceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :workplace, :string
  end
end
