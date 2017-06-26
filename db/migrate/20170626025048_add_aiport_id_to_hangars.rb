class AddAiportIdToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :airport_id, :integer
  end
end
