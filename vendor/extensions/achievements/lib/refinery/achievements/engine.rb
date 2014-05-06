module Refinery
  module Achievements
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Achievements

      engine_name :refinery_achievements

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "achievements"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.achievements_admin_achievements_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/achievements/achievement',
            :title => 'tournament'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Achievements)
      end
    end
  end
end
