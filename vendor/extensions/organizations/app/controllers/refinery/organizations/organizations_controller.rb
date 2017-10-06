module Refinery
  module Organizations
    class OrganizationsController < ::ApplicationController

      before_action :find_all_organizations
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @organization in the line below:
        present(@page)
      end

      def show
        @organization = Organization.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @organization in the line below:
        present(@page)
      end

    protected

      def find_all_organizations
        @organizations = Organization.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/organizations").first
      end

    end
  end
end
