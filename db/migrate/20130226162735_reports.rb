class Reports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.references :user
      t.references :comment
      
      t.timestamps
    end
  end

  def down
    drop_table :reports
  end
end
