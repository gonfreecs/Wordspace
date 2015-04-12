include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :magazine do |f|
    f.name 'name'
    f.decription 'description'
    f.image {
      fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'),
                          'image/png')
    }
  end
end
