class ChangeEventsAttributeDefaults < ActiveRecord::Migration
  def change
    change_column :events, :start_time,  :string, default: "10:00 am"
    change_column :events, :date,  :string, default: "Saturday"
    change_column :events, :duration,  :string, default: "6 hours + drinking overtime"

  end
end
