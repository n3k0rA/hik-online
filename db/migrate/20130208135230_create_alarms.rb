class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|

      t.timestamps
    end
  end
end
