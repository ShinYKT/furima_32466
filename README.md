# README

# Users

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| nick_name     | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| name_kana     | string | null: false |
| password      | string | null: false |
| birth         | string | null: false |

### Association

- has_many :Items
- has_many :Buys


# Items

| Column        | Type   | Options     |
| ------------  | ------ | ----------- |
| item          | string | null: false |
| text          | text   | null: false |
| category      | string | null: false |
| state         | string | null: false |
| delivery_fee  | string | null: false |
| delivery_area | string | null: false |
| delivery_days | string | null: false |
| price         | string | null: false |


### Association

- belongs_to :user
- belongs_to :buy


# Buys

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| card_information | string | null: false |
| expiration_date  | string | null: false |
| security_code    | string | null: false |
| postal_code      | string | null: false |
| prefectures      | string | null: false |
| municipality     | string | null: false |
| address          | string | null: false |
| building_name    | string |  |
| phone_number     | string | null: false |

### Association

- belongs_to :user
- has_one :buy