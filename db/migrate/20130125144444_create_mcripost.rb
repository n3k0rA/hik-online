class CreateMcripost < ActiveRecord::Migration
  def up
    create_table :microposts do |t|
      t.references :user, :event, :comment
      t.integer :content
      t.integer :target_id
      
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
    
  end

  def down
    drop_table :microposts
  end
end
