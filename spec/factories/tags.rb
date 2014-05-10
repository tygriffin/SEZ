FactoryGirl.define do
  factory :tag do
    name        'k-9'
    association :article
  end
end