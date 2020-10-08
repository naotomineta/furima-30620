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
  | birthday        | integer | null: false |

  ### Association

  - has_many :comments
  - has_many :items
  - has_many :orders

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

  | Column        | Type       | Options     |
  | ------------  | ------     | ----------  |
  | product_name  | string     | null: false |
  | price         | integer    | null: false |
  | category      | string     | null: false |
  | user          | references |             |
  
  ### Association

  - belongs_to :user
  - has_many :comments
  - has_one :order

  ## orders テーブル

  | Column           | Type       | Options     |
  | --------------   | ------     | ----------  |
  | card_number      | integer    | null: false |
  | card_exp_month   | integer    | null: false |
  | card_cvc         | integer    | null: false |
  | postal_code      | integer    | null: false |
  | prefecture       | string     | null: false |
  | city             | string     | null: false |
  | adresses         | string     | null: false |
  | building         | string     | null: false |
  | phone_number     | integer    | null: false |
  | user             | references |             |
  | items            | references |             |

  ### Association

  - belongs_to :item
  - belongs_to :user









 