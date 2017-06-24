class AddUserAndAirportToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :associated_user, :integer
    add_column :leases, :associated_airport, :integer
  end
end
