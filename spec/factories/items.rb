FactoryBot.define do
  factory :item do
    name { 'カテゴリー' }
    description { '商品の説明' }
    category_id { '2' }
    condition_id { '2' }
    burden_id { '2' }
    area_id { '2' }
    day_id { '2' }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
