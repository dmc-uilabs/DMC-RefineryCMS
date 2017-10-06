module Refinery
  module Organizations
    class Organization < Refinery::Core::BaseModel
      self.table_name = 'refinery_organizations'
      has_one :address
      accepts_nested_attributes_for :address


      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:name]

    end
  end
end
