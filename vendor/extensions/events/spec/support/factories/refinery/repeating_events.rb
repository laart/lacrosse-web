
FactoryGirl.define do
  factory :repeating_event, :class => Refinery::Events::RepeatingEvent do
    sequence(:repeating_event_title) { |n| "refinery#{n}" }
  end
end

