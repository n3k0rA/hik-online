class AddCommentIdToMcriposts < ActiveRecord::Migration
  def change
    add_column :microposts, :comment, :reference
  end
end
