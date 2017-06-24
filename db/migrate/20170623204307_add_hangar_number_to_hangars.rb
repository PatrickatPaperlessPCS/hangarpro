class AddHangarNumberToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :hangar_number, :string
  end
end
