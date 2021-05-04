class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :birth_day
    validates :last_name_kana
    validates :first_name_kana
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "は全角で入力ください"} do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カナで入力ください" } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "は6文字以上の半角英数で入力ください" }

  has_many :items
  has_many :purchases
end
