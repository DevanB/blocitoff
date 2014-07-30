FactoryGirl.define do
  factory :todo do
    user
    description "Mop up the kool aid"
    created_at Time.now
  end
end