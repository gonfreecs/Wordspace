# mohab
# 3.4.2015
# user factorygirl
FactoryGirl.define do
  factory :user do |f|
    f.email 'mohabashraf33@gmail.com'
    f.password 1_234_567_890
    f.is_female false
    f.is_sponsor false
    f.firstname 'ahmed'
    f.lastname 'ashraf'
    f.user_id 8
  end
end
