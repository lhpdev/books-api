FactoryBot.define do
  factory :book do
    association :author
    sequence(:title) { |n| "Title: #{n}" }
    sequence(:isbn) { |n| "#{n}" }
  end
end
