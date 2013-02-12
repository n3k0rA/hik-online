class CreateAlarmsTable < ActiveRecord::Migration
  def up
    create_table :alarms do |t|
      t.references    :user
      t.string        :title
      t.boolean       :active, :default=>true
      t.string        :keyword
      t.string        :where
      t.timestamps
    end
  end

  def down
    drop_table :alarms
  end
end
