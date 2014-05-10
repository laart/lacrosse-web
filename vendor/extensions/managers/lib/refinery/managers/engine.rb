module Refinery
  module Managers
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Managers

      engine_name :refinery_managers

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "managers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.managers_admin_managers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/managers/manager',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Managers)
      end
    end
  end
end
