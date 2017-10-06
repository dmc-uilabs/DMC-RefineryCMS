
FactoryGirl.define do
  factory :address, :class => Refinery::Organizations::Address do
    sequence(:street1) { |n| "refinery#{n}" }
  end
end

