class AddDefaultValuesToApprovedAndCancelled < ActiveRecord::Migration
  def up
    change_column :events, :approved, :boolean, :default=>false
    change_column :events, :cancelled, :boolean, :default=>false
  end
  
  def down
    change_column :events, :approved, :boolean
    change_column :events, :cancelled, :boolean
  end
end
