class CreateHangars < ActiveRecord::Migration
  def change
    create_table :hangars do |t|
      t.string :type
      t.string :size
      t.date :last_payment
      t.date :first_payment
      t.boolean :leased

      t.timestamps null: false
    end
  end
end
