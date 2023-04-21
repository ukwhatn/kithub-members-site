class RemoveWorkplaceFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :workplace, :string
  end
end
