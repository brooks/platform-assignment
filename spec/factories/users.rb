FactoryGirl.define do
  
  factory :brooks_user, class: User do
    name "Brooks Mason"
    line1 "500 Henry Street"
    line2 ""
    city "San Francisco"
    state "California"
    zip "94114"
    phone "123-456-7890"
  end

  factory :maggie_user, class: User do
    name "Maggie Utgoff"
    line1 "500 Alliklik Road"
    line2 ""
    city "South Lake Tahoe"
    state "California"
    zip "96150"
    phone "454-555-2020"
  end
end
