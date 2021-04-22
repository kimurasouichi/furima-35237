class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Include both letters and numbers' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } 
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } 
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' } 
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
  
end
