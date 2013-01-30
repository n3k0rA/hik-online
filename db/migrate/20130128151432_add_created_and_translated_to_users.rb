class AddCreatedAndTranslatedToUsers < ActiveRecord::Migration
  def up
    add_column :users, :created, :integer, :default => 0
    add_column :users, :translated, :integer, :default => 0
  end
  def down
    remove_column :users, :created
    remove_column :users, :translated
  end
end
