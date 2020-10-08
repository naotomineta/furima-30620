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

## users テーブル
  
  | Column          | Type   | Options     |
  | --------------  | ------ | ----------  |
  | email           | string | null: false |
  | password        | string | null: false |
  | nickname        | string | null: false |
  | first_name      | string | null: false |
  | last_name       | string | null: false |
  | first_name_kana | string | null: false |
  | last_name_kana  | string | null: false |
  | birthday        | date   | null: false |

  ### Association

  - has_many :comments
  - has_many :items
  - has_many :managements

  ## comments テーブル

  | Column         | Type       | Options     |
  | -------------  | ------     | ----------  |
  | text           | text       | null: false |
  | user           | references |             |
  | item           | references |             |

  ### Association
  
  - belongs_to :user
  - belongs_to :item

  ## items テーブル

  | Column                       | Type       | Options          |
  | -------------------------    | ------     | ----------       |
  | product_name                 | string     | null: false      |
  | price                        | integer    | null: false      |
  | item_info                    | text       | null: false      |
  | item_sales_status_id         | integer    | null: false      | 
  | item_shipping_fee_status_id  | integer    | null: false      |
  | item_prefecture_id           | integer    | null: false      |
  | item_schedule_delivery_id    | integer    | null: false      |
  | category_id                  | integer    | null: false      |
  | user                         | references | foreign_key: true|
  
  ### Association

  - belongs_to :user
  - has_many :comments
  - has_one :management

  ## orders テーブル

  | Column           | Type          | Options     |
  | --------------   | ------        | ----------  |
  | postal_code      | string        | null: false |
  | prefecture_id    | integer       | null: false |
  | city             | string        | null: false |
  | adresses         | string        | null: false |
  | building         | string        |             |
  | phone_number     | string        | null: false |
  | management       | references    | foreign_key: true |
  

  ### Association

  - belongs_to :item
  - belongs_to :user
  - has_one :management

  ## managements テーブル

  | Column  | Type       | Options           |
  | ------  | ------     | ----------------  |
  | user    | references | foreign_key: true |
  | item    | references | foreign_key: true |

  ### Association

  - belongs_to :user
  - belongs_to :item
  - has_one :order








 