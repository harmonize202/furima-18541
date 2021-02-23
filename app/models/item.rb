class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # 商品が削除されると購入情報も削除される
  # has_one    :buy,  dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :shipment_day

  validates :item_name,   presence: true
  validates :explanation, presence: true
  validates :image,       presence: true

  # 「価格」は半角数字のみ、かつ、の入力
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price,   presence: true, format: { with: VALID_PRICE_REGEX },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # ジャンルの選択が「---」(１つ目の選択肢)の時は保存できないようにする。バリデーションの１種。
  validates :category_id,        numericality: { other_than: 1 }
  validates :status_id,          numericality: { other_than: 1 }
  validates :delivery_fee_id,    numericality: { other_than: 1 }
  validates :shipment_source_id, numericality: { other_than: 1 }
  validates :shipment_day_id,    numericality: { other_than: 1 }
end
