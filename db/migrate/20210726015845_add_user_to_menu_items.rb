class AddUserToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :menu_items, :user, null: false, foreign_key: true
  end
end
