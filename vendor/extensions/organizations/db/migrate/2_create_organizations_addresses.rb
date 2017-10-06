class CreateOrganizationsAddresses < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_organizations_addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-organizations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/organizations/addresses"})
    end

    drop_table :refinery_organizations_addresses

  end

end
