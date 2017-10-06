class CreateOrganizationsOrganizations < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_organizations do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-organizations"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/organizations/organizations"})
    end

    drop_table :refinery_organizations

  end

end
