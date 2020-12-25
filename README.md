# README

# Users

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| nick_name     | string | null: false |
| email         | string | unique: true |
| encrypted_password| string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| date           | string | null: false |

### Association
_
- has_many :Items
- has_many :Buys


# Items

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| item          | string | null: false |
| text          | text   | null: false |
| category_id      | integer | null: false |
| state_id         | integer  | null: false |
| delivery_fee_id  | integer  | null: false |
| delivery_area_id | integer  | null: false |
| delivery_days_id | integer  | null: false |
| price         | string | null: false |


### Association

- belongs_to :user
- belongs_to :buy


# Buys

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| postal_code      | string | null: false |
| prefectures      | string | null: false |
| municipality     | string | null: false |
| address          | string | null: false |
| building_name    | string |  |
| phone_number     | string | null: false |

### Association

- belongs_to :user
- has_one :buy

# User_Buy

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy
