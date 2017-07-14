FactoryGirl.define do
  factory :tree do
    sequence :name do |n|
      "TreeName-#{n}"
    end
  end
end
