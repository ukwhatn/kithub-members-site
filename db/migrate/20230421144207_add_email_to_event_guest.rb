class AddEmailToEventGuest < ActiveRecord::Migration[7.0]
  def change
    add_column :event_guests, :email, :string
  end
end
