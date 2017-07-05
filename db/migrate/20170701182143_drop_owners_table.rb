class DropOwnersTable < ActiveRecord::Migration
  def up
    drop_table :owners
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end

 