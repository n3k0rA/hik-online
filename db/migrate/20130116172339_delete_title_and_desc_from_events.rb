class DeleteTitleAndDescFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :title
    remove_column :events, :description
  end
end
