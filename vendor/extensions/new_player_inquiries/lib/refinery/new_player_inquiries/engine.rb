module Refinery
  module NewPlayerInquiries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::NewPlayerInquiries

      engine_name :refinery_new_player_inquiries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "new_player_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.new_player_inquiries_admin_new_player_inquiries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/new_player_inquiries/new_player_inquiry',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::NewPlayerInquiries)
      end
    end
  end
end
