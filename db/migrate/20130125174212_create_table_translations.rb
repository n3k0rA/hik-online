class CreateTableTranslations < ActiveRecord::Migration
  def up
    create_table :translations do |t|
      t.references :user, :event
      t.text :des_es, :des_eu, :des_fr, :des_en, :comment
      t.string :title_es, :title_eu, :title_fr, :title_en
      
      t.timestamps
    end
  end

  def down
    drop_table :translations
  end
end
