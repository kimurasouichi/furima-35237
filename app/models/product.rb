class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  validates :title, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
end
