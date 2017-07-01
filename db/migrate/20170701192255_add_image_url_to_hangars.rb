class AddImageUrlToHangars < ActiveRecord::Migration
  def change
    add_column :hangars, :image_url, :string
  end
end
