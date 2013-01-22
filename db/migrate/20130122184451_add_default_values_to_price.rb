class AddDefaultValuesToPrice < ActiveRecord::Migration
  def up
    change_column :events, :price, :integer, :default=>0
  end
  def down
    change_column :events, :price, :integer
  end
end
