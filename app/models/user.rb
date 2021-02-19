class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数字(大文字・小文字)のみの入力(passwordにバリデーションをかける)
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :nickname, presence: true

  # 全角(漢字・ひらがな・カタカナ)、かつ「々」の入力
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  # with_optionsメソッドでバリデーションをまとめる
  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :last_name
    validates :first_name
  end

  # 全角(カタカナ)のみの入力
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  # with_optionsメソッドでバリデーションをまとめる
  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true
end
