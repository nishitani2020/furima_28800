class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :password, presence: true, length: { minimum: 6 } , format: { with: /\A[a-zA-Z]+\z/ } ,confirmation: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ン]+\z/ }
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ン]+\z/ }
  validates :birth_date, presence: true

end
