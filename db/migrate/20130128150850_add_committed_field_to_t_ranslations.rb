class AddCommittedFieldToTRanslations < ActiveRecord::Migration
  def up
    add_column :translations, :committed, :boolean, :default => false
  end
  
  def down
    remove_column :translations, :committed
  end
end
