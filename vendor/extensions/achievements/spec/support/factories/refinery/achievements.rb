
FactoryGirl.define do
  factory :achievement, :class => Refinery::Achievements::Achievement do
    sequence(:tournament) { |n| "refinery#{n}" }
  end
end

