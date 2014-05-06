module Refinery
  module Players
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Players

      engine_name :refinery_players

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "players"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.players_admin_players_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/players/player',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Players)
      end
    end
  end
end
