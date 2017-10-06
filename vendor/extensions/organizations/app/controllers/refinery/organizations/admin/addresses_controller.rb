module Refinery
  module Organizations
    module Admin
      class AddressesController < ::Refinery::AdminController

        crudify :'refinery/organizations/address',
                :title_attribute => 'street1'

        private
        # Only allow a trusted parameter "white list" through.
        def address_params
          params.require(:address).permit(:street1, :street2, :city, :state, :country, :zip, :organization_id)
        end
      end
    end
  end
end
