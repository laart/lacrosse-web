class ChangeMultipleColumnsOfRefineryEvents < ActiveRecord::Migration
  def up
  	remove_column :refinery_events, :date
  	remove_column :refinery_events, :photo_id
  	remove_column :refinery_events, :blurb
  	remove_column :refinery_events, :position

  	add_column :refinery_events, :start_time, :datetime
  	add_column :refinery_events, :end_time, :datetime
  	add_column :refinery_events, :event_type, :string
  	add_column :refinery_events, :description, :text
  	add_column :refinery_events, :all_day, :boolean, :default => false
  end

  def down
  end
end
