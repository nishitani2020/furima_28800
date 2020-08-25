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
| family_name      | string | null: false |
| family_name_kana | string | null: false |
| first_name       | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |


### Association

- has_many :items
- belongs_to :address
- has_many :purchases

## items テーブル

| Column           | Type   | Options    |
| ---------------- | ------ | ---------- |
| image            | text   | null:false |
| name             | string | null:false |
| explanation      | text   | null:false |
| category_id      | string | null:false |
| status_id        | string | null:false |
| delivery_cost_id | string | null:false |
| delivery_area_id | string | null:false |
| delivery_days_id | string | null:false |
| user_id          | string | null:false |

### Association

- belongs_to :user
- belongs_to :purchase

## addresses

| Colomn          | Type    | Options    |
| --------------- | ------- | ---------- |
| postal_code     | integer | null:false |
| prefectures_id  | string  | null:false |
| city            | string  | null:false |
| address         | string  | null:false |
| building_name   | string  |            |
| phone_number    | integer | null:false |

### Association

- has_many :users
- belongs_to :purchase


## purchases

| Colomn  | Type   | Options    |
| ------- | ------ | ---------- |
| user_id | string | null:false |
| item_id | string | null:false |

### Association

- belongs_to :user
- has_mane :items
- has_one :address