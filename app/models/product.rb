class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title, :text, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
end
