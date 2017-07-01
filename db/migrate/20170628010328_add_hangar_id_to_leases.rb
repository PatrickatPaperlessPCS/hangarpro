class AddHangarIdToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :hangar_id, :integer
  end
end
