
FactoryGirl.define do
  factory :manager, :class => Refinery::Managers::Manager do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

