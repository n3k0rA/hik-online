class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :event
      t.text :body
      t.boolean :banned
      
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :event_id
  end
end
