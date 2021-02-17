
# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_day    | integer | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :comments

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| shipment_source | string     | null: false                    |
| shipment_day    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shipment_source
- belongs_to_active_hash :shipment_day

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :comments
- has_one    :delivery

## deliveries テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| credit_card      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | integer    | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to_active_hash :prefecture

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| buy        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy
