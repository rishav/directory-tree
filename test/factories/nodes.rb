FactoryGirl.define do
  factory :node do
    sequence :name do |n|
       "MyNode-#{n}"
     end
    parent_id nil
    tree
  end
end
