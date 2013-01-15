class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string
    add_column :users, :province, :string
    add_column :users, :website, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
