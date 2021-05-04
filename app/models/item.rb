class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "は数値で入力してください" },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "につきましては販売価格を参照ください" }

  with_options presence: true, numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
end
