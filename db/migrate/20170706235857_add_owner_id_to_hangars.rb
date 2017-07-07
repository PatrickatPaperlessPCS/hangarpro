class AddOwnerIdToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :owner_id, :integer
  end
end
