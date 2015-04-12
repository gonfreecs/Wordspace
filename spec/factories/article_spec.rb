  # mohab
  # 3.4.2015
  # article factorygirl

  include ActionDispatch::TestProcess
  FactoryGirl.define do
    factory :article do |f|
      f.tag_list 'sport,movie'
      f.title 'ahmed'
      f.user_id 1
      f.image do
        fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'),
                            'image/png')
      end
    end
  end
