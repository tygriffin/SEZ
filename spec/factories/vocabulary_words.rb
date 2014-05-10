FactoryGirl.define do
  factory :vocabulary_word do
    word            'general'
    definition      'relating to the main or major parts of something rather than the details'
    translation     '一般的'
    part_of_speech  'adjective'
    instance        'general'
    association     :article
  end
end