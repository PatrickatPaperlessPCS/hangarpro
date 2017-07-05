class DropFbosTable < ActiveRecord::Migration
  def up
    drop_table :fbos
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end 