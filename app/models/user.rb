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
  end

  with_options presence: true do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Include both letters and numbers' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
end