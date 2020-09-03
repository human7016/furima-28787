# テーブル設計

## users テーブル

| Column           | Type    | Options    |
| ---------------- | ------- | ---------- |
| nickname         | string  | null:false |
| email            | string  | null:false |
| password         | string  | null:false |
| family_name      | string  | null:false |
| first_name       | string  | null:false |
| family_name_kana | string  | null:false |
| first_name_kana  | string  | null:false |
| birthday         | date    | null:false |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column           | Type       | Options                      |
| -----------------| ---------- | ---------------------------- |
| user             | references | null:false, foreign_key:true |
| image            | string     | null:false                   |
| name             | string     | null:false                   |
| explanation      | text       | null:false                   |
| price            | integer    | null:false                   |
| category_id      | integer    | null:false                   |
| quality_id       | integer    | null:false                   |
| delivery_fee_id  | integer    | null:false                   |
| shipping_area_id | integer    | null:false                   |
| shipping_date_id | integer    | null:false                   |
| good_point       | integer    |                              |

### Association

- belongs_to :user
- has_one    :purchase_history

## purchase_histories テーブル

| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| user         | references | null:false, foreign_key:true |
| item         | references | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| purchase_history | references | null:false                   |
| postal_code      | string     | null:false                   |
| prefectures      | integer    | null:false                   |
| city             | string     | null:false                   |
| address          | string     | null:false                   |
| building         | string     |                              |
| phone_number     | string     | null:false                   |

### Association

- belongs_to :purchase_history
