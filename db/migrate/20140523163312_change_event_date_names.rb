class ChangeEventDateNames < ActiveRecord::Migration
  def up
   	rename_column :refinery_events, :start_time, :starttime
  	rename_column :refinery_events, :end_time, :endtime
  end

  def down
  end
end
