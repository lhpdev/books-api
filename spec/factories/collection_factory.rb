FactoryBot.define do
  factory :collection, class: "Collection" do
    sequence(:title) { |n| "Collection: #{n}" }
  end
end
