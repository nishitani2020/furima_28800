# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | strign | null: false |
| password_confirm | string | null: false |
| name             | string | null: false |
| mname_kana       | string | null: false |
| birth_date       | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchase

## items テーブル

| Column        | Type   | Options    |
| ------------- | ------ | ---------- |
| image         | text   | null:false |
| imagge_name   | string | nill:false |
| explanation   | text   | null:false |
| category      | string | null:false |
| status        | string | null:false |
| delivery_cost | string | null:false |
| delivery_area | string | null:false |
| delivery_days | string | null:false |

### Association

- belongs_to :users
- has_many :comments

##comments

| Column   | Type | Options    |
| comment  | text | null:false |

### Association

- belongs_to:users
- belongs_to:items

## purchase

| Culomn          | Type    | Options    |
| --------------- | ------- | ---------- |
| card_num        | integer | null:false |
| expiration_date | integer | null:false |
| security_code   | integer | null:false |
| postal_code     | integer | null:false |
| prefectures     | string  | null:false |
| city            | string  | null:false |
| address         | string  | null:false |
| building_name   | string  |            |
| phone_number    | integer | null:false |

### Association

-belongs_to:users