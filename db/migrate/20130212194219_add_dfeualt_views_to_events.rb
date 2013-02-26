class AddDfeualtViewsToEvents < ActiveRecord::Migration
  def up
    change_column :events, :views, :integer, :default => 0
  end
  
  def down
    change_column :events, :views, :integer
  end
  

end
