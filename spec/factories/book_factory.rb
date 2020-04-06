FactoryBot.define do
  factory :book do
    association :author, factory: :author
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    sequence(:isbn) { |n| "#{n}" }
    sequence(:year) { |n| "200#{n}" }
  end
end
