class AddInfoToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :first_name, :string
    add_column :owners, :last_name, :string
    add_column :owners, :company, :string
    add_column :owners, :airport_id, :string
  end
end
