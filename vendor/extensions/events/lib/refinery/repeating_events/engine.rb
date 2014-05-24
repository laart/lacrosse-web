module Refinery
  module Events
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Events

      engine_name :refinery_events

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "repeating_events"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.events_admin_repeating_events_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/events/repeating_event',
            :title => 'repeating_event_title'
          }
          plugin.menu_match = %r{refinery/events/repeating_events(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::RepeatingEvents)
      end
    end
  end
end
