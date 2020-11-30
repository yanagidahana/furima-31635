FactoryBot.define do
  factory :buy do
    postcode                    {"123-4567"}
    shipping_place_id           {2}
    city                        {"市区町村"}
    block                       {"番地"}
    building                    {"建物名"}
    phone                       {"09012345678"}
    token                       {"tok_6fe5a9aaaaaaaaaaee0000000000"}
    # association :user
    # association :item


  end
end