FactoryBot.define do
  factory :buy do
    postcode                    {"123-4567"}
    shipping_place_id           {2}
    city                        {"市区町村"}
    block                       {"番地"}
    building                    {"建物名"}
    phone                       {"電話番号"}

    # user                         {""}
    # item                         {""}


    # after(:build) do |item|
    #   area.image.attach(io: File.open('spec/public/images/harry.jpeg'), filename: 'harry.jpeg')
    # end
  end
end