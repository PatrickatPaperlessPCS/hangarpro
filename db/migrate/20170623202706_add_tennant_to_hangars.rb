class AddTennantToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :tennant, :string
    add_column :hangars, :tail_number, :string
  end
end
