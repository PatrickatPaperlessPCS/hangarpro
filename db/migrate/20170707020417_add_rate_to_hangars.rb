class AddRateToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :rate, :integer
  end
end
