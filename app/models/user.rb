class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :items
  has_many :purchase_histories

  # 英字1字以上数字1字以上が含まれているときにマッチする変数
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  # validates
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /.+[@].+/ }
  validates :password, presence: true, format: { with: PASSWORD_REGEX }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
end
