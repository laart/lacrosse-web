class AddRepeatingEventToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :repeating_event_id, :integer
  end
end
