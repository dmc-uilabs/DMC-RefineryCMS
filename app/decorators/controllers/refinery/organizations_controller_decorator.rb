Refinery::Organizations::Admin::OrganizationsController.class_eval do
  def new
    @organization = Refinery::Organizations::Organization.new
    @organization.build_address
  end
end
