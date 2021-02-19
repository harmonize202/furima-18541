class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数字(大文字・小文字)のみの入力(passwordにバリデーションをかける)
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

  validates :nickname, presence: true

  # 全角(漢字・ひらがな・カタカナ)のみの入力
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }

  # 全角(カタカナ)のみの入力
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana,  presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }

  validates :birthday,        presence: true
end
