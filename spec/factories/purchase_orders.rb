FactoryBot.define do
  factory :purchase_order do
    post_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 0o1201231234 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
