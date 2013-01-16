class CategoryEventJoin < ActiveRecord::Migration
  def up
    create_table :categories_events, :id => false do |t|
      t.integer :category_id, :null => false
      t.integer :event_id, :null=>false
    end
    add_index(:categories_events, [:category_id, :event_id], :unique => true)
  end

  def down
    drop_table :categories_events
  end
end
    
