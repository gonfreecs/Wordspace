include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :article do |f|
    f.title 'xxxxtestxxxx'
    f.body 'Text'
    f.plain_body 'Text'
    f.image {
      fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'),
                          'image/png')
    }
  end
end
