module Refinery
  module Organizations
    class Address < Refinery::Core::BaseModel
      belongs_to :organization, class_name: 'Refinery::Organizations::Organization'


      validates :street1, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
