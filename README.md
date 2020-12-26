# README

# Users

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| nick_name     | string | null: false |
| email         | string | unique: true null: false |
| encrypted_password| string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday         | date | null: false |

### Association
_
- has_many :items
- has_many :uesr_buys


# Items

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| name          | string | null: false |
| text          | text   | null: false |
| category_id      | integer | null: false |
| state_id         | integer  | null: false |
| delivery_fee_id  | integer  | null: false |
| prefecture_id    | integer  | null: false |
| delivery_day_id | integer  | null: false |
| price         | integer | null: false |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :user_buy


# Buys

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| postal_code      | string | null: false |
| prefecture_id   | integer | null: false |
| municipality     | string | null: false |
| address          | string | null: false |
| building_name    | string |  |
| phone_number     | string | null: false |
| user_buy  | references | null: false, foreign_key: true |

### Association

- belongs_to :user_buy

# UserBuys

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy
- belongs_to :item