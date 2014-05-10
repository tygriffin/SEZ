FactoryGirl.define do
  factory :article do
    body          'I am the very model of a major modern general.'
    pubdate       Time.zone.today - 1.day
    pubtype       'feature'

    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/test_image.jpg')))

    association   :author, :factory => :author
    association   :topic,  :factory => :topic

    factory :dog_article do
      title       'Dogs!'
      description 'This article is all about dogs.'
    end

    factory :cat_article do
      title       'Cats!'
      description 'This article is all about cats.'
    end

  end
end