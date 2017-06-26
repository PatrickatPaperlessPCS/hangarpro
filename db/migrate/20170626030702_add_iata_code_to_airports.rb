class AddIataCodeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :iata_code, :string
  end
end
