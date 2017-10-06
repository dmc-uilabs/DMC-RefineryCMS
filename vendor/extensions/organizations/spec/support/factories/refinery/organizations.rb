
FactoryGirl.define do
  factory :organization, :class => Refinery::Organizations::Organization do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

