class AddFieldsToRefineryEventsRepeatingEvents < ActiveRecord::Migration
  def change
  	add_column :refinery_events_repeating_events, :starttime, :datetime
  	add_column :refinery_events_repeating_events, :endtime, :datetime
  	add_column :refinery_events_repeating_events, :frequency, :integer, :default => 1
  	add_column :refinery_events_repeating_events, :period, :string, :default => "monthly"
  	add_column :refinery_events_repeating_events, :all_day, :boolean, :default => false
  end
end
