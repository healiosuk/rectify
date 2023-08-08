class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address_id, :integer
  end
end
