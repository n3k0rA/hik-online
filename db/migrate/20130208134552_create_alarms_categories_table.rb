class CreateAlarmsCategoriesTable < ActiveRecord::Migration
  def up
    create_table :alarms_categories, :id => false do |t|
      t.references :alarm, :category
    end
    add_index(:alarms_categories, [:alarm_id])
  end

  def down
    drop_table :alarms_categories
  end
end
