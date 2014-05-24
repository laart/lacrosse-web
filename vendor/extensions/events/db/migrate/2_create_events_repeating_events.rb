class CreateEventsRepeatingEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events_repeating_events do |t|
      t.string :repeating_event_title
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/repeating_events"})
    end

    drop_table :refinery_events_repeating_events

  end

end
