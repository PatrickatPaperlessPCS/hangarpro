class AddMapUrlToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :map_url, :string
  end
end
