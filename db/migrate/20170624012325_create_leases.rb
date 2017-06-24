class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.date :lease_start
      t.integer :lease_term
      t.date :lease_end
      t.boolean :lease_signed
      t.string :signature
      t.string :additional_file

      t.timestamps null: false
    end
  end
end
