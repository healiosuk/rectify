class AddUserToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user, :string
  end
end
