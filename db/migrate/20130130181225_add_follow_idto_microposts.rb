class AddFollowIdtoMicroposts < ActiveRecord::Migration
  def up
    add_column :microposts, :follow_id, :reference
  end

  def down
    remove_column :microposts, :follow_id
  end
end
