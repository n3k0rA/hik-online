class AddTownAndGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :town, :string
    add_column :users, :gender, :string
  end
end
