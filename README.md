# テーブル設計

## users テーブル

| Column            | Type    | Options    |
| ----------------- | ------- | ---------- |
| nickname          | string  | null:false |
| email             | string  | null:false |
| password          | string  | null:false |
| family_name       | string  | null:false |
| first_name        | string  | null:false |
| family_name(kana) | string  | null:false |
| first_name(kana)  | string  | null:false |
| birthday          | date    | null:false |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column        | Type       | Options                      |
| --------------| ---------- | ---------------------------- |
| user_id       | references | null:false, foreign_key:true |
| image         | string     | null:false                   |
| name          | string     | null:false                   |
| explanation   | text       | null:false                   |
| price         | integer    | null:false                   |
| category      | integer    | null:false                   |
| quality       | integer    | null:false                   |
| delivery_fee  | integer    | null:false                   |
| shipping_area | integer    | null:false                   |
| shipping_date | integer    | null:false                   |
| good_point    | integer    |                              |
| sold_out      | boolean    | null:false                   |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_histories テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user_id          | references | null:false, foreign_key:true |
| item_id          | references | null:false, foreign_key:true |
| postal_code      | string     | null:false                   |
| prefectures      | integer    | null:false                   |
| city and address | string     | null:false                   |
| building         | string     |                              |
| phone_number     | string     | null:false                   |

### Association

- belongs_to :user
- belongs_to :item
