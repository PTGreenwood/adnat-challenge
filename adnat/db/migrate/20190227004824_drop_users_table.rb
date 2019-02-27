class DropUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :Users
  end
end
