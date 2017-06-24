class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.string :id_code
      t.string :lease_id

      t.timestamps null: false
    end
  end
end
