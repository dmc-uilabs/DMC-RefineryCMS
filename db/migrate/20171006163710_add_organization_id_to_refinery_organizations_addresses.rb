class AddOrganizationIdToRefineryOrganizationsAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_organizations_addresses, :organization_id, :integer
  end
end
