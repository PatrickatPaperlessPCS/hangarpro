class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :signed_lease, :date
    add_column :users, :lease_expires, :date
  end
end
