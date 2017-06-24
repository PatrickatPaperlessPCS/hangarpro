class AddHangarTypeToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :hangar_type, :string
  end
end
