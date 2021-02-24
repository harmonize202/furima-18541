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

  # 「価格」は半角数字のみ、かつ、の入力
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
    validates :price, format: { with: VALID_PRICE_REGEX },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「---」(１つ目の選択肢)の時は保存できないようにする。バリデーションの１種。
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :shipment_day_id
  end
end
