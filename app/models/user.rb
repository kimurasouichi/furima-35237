class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :last_name, presence: true
  # validates :first_nama, presence: true
  # validates :last_nama_kana, presence: true
  # validates :first_nama_kana, presence: true
  # validates :birth_day, presence: true

end
