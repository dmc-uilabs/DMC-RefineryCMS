module Refinery
  module Organizations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Organizations

      engine_name :refinery_organizations

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "organizations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.organizations_admin_organizations_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Organizations)
      end
    end
  end
end
