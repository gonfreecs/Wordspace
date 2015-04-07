# mohab
# 3.4.2015
# article factorygirl
FactoryGirl.define do
  factory :article do |f|
    f.tag_list 'sport,movie'
    f.title 'ahmed'
    f.user_id 1
  end
end
