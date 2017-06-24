class AddAiportIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :airport_id, :integer
  end
end
