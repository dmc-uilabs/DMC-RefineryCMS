module Refinery
  module Organizations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Organizations

      engine_name :refinery_organizations

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "addresses"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.organizations_admin_addresses_path }
          plugin.pathname = root
          plugin.menu_match = %r{refinery/organizations/addresses(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Addresses)
      end
    end
  end
end
