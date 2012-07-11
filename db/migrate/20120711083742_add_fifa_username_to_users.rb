class AddFifaUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fifa_username, :string
  end
end
