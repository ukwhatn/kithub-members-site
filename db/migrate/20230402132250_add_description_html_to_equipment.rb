class AddDescriptionHtmlToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :description_html, :text, null: false, default: ""
  end
end
