include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do |f|
    f.firstname 'fname'
    f.lastname 'lname'
    f.email 'email@emil.com'
    f.password 'password'
  end
end
