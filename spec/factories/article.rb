include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :article do |f|
    f.title 'xxxxtestxxxx'
    f.body 'Text'
    f.plain_body 'Text'
    f.tag_list 'Tag1,Tag2'
    f.image {
      fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'),
                          'image/png')
    }
  end
end
