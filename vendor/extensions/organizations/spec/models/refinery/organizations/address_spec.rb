require 'spec_helper'

module Refinery
  module Organizations
    describe Address do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:address,
          :street1 => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:street1) { should == "Refinery CMS" }
      end
    end
  end
end
