class CreateTableMicroposts < ActiveRecord::Migration
  def up
    create_table :microposts do |t|
      t.integer :user_id
      t.integer :content
      t.integer :target_id
      t.integer :event_id
      
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end

  def down
    drop_table :microposts
  end
end
