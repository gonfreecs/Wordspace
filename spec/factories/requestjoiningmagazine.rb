include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :requestjoiningmagazine do |f|
    f.user_id '12'
    f.article_id '4'
  end
end
