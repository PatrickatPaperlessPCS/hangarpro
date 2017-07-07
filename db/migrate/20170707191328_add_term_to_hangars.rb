class AddTermToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :term, :integer
  end
end
