FactoryGirl.define do
  factory :account do
    date "2017-12-27"
    title  "abc"
    amount "10000"
    
  factory :invalid_post do
  	amount "in words"
  end
end
end