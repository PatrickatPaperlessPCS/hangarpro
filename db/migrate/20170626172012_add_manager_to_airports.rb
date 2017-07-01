class AddManagerToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :airport_manager, :string
    add_column :airports, :manager_phone, :string
  end
end
