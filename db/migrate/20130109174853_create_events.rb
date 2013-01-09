class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :id
      t.string :title
      t.datetime :start_date
      t.datetime :finish_date
      t.string :place
      t.string :town
      t.decimal :price
      t.text :description
      t.string :email
      t.string :website
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id
      t.string :address
      t.text :des_es
      t.text :des_eu
      t.text :des_en
      t.text :des_fr
      t.integer :views
      t.string :title_es
      t.string :title_eu
      t.string :title_en
      t.string :title_fr
      t.boolean :approved
      t.boolean :reminded
      t.boolean :cancelled
      t.text :cancel_message
      t.string :province
      t.string :tickets

      t.timestamps
    end
  end
end
