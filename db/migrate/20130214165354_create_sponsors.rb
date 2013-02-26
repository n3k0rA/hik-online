class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :title_es
      t.string :title_eu
      t.string :title_fr
      t.string :title_en
      t.text :body_es
      t.text :body_eu
      t.text :body_fr
      t.text :body_en
      t.boolean :es
      t.boolean :eu
      t.boolean :fr
      t.boolean :en
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
