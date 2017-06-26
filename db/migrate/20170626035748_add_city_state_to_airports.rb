class AddCityStateToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :city, :string
    add_column :airports, :state, :string
    add_column :airports, :country, :string
  end
end
