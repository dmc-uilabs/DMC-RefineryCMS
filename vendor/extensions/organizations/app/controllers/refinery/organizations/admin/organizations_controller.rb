module Refinery
  module Organizations
    module Admin
      class OrganizationsController < ::Refinery::AdminController

        crudify :'refinery/organizations/organization',
                :title_attribute => 'name'

        private
        # Only allow a trusted parameter "white list" through.
        def organization_params
          params.require(:organization).permit(:name, :description, address_attributes: [:id, :street1, :street2, :city, :state, :country, :zip])
        end
      end
    end
  end
end
