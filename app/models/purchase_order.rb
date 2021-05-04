class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
    validates :area_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は(-)つきでお願いします" }
  end

  validates :area_id, numericality: { other_than: 1, message: "を選択してください" }

  validates :phone_number, format: { with: /\A[0-9]+\z/, message: "は半角数値で入力してください" }
  validates :phone_number, length: { maximum: 11 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Order.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name,
                 phone_number: phone_number, purchase_id: purchase.id)
  end
end
