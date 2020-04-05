FactoryBot.define do
  factory :collection, class: "Books::Collection" do
    sequence(:title) { |n| "Collection: #{n}" }
  end
end
