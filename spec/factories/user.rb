include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do |f|
    f.firstname 'mayar'
    f.lastname 'ali'
    f.email 'email@emil.com'
    f.password 'password'
  end
end
