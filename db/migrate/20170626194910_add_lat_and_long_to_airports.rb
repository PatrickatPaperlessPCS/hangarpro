class AddLatAndLongToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :lat, :string
    add_column :airports, :long, :string
  end
end
