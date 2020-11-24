FactoryBot.define do
  factory :item do
    name                  {"絵本"}
    category_id           {2}
    explanation           {"美品です"}
    price                 {"9999999"}
    status_id             {2}
    shipping_id           {2}
    shipping_place_id     {2}
    date_shipment_id      {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/public/images/harry.jpeg'), filename: 'harry.jpeg')
    end
  end
end