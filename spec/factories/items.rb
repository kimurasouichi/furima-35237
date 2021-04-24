FactoryBot.define do
  factory :item do
    image { '' }
    name { 'カテゴリー' }
    description { '商品の説明' }
    category_id { '1' }
    condition_id { '1' }
    burden_id { '1' }
    area_id { '1' }
    day_id { '1' }
    price { '1000' }
  end
end
