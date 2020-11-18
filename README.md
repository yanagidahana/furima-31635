# DB 設計

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string            |  null: false           |
| email              | string            |  null: false           |
| encrypted_password | string            |  null: false           |
| last-name          | string            |  null: false           |
| first-name         | string            |   null: false          |
| last-name-kana     | string            |  null: false           |
| first-name-kana    | string            |  null: false           |
| birthday-year      | integer           |  null: false           |
| birthday-month     | integer           |  null: false           |
| birthday-day       | integer           |   null: false          |

### Association
* has_many :items
* has_many :records




## items table
| Column                              | Type       | Options                              |
|-------------------------------------|------------|------------------                    |
| name                                | string     | null: false                          |
| category                            | string     | null: false                          |
| explanation                         | string     | null: false                          |
| price                               | string     | null: false                          |
| status                              | string     | null: false                          |
| Shipping                            | string     | null: false                          |
| Shipping-place                      | string     | null: false                          |
| date-shipment                       | string     | null: false                          |


### Association
- has_one :record
* has_many :users




## records table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| seller_id   | references | null: false, foreign_key: true       |
| buyer_id    | references | null: false, foreign_key: true       |


### Association
- belongs_to :seller_id
- belongs_to :buyer_id
* has_many :users
- has_one :item
- has_one :area



## areas table
| Column        | Type       | Options           |
|-------------  |------------|-------------------|
| postcode      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| block         | string     | null: false       |
| building      | string     |
| phone         | string     | null: false       |


### Association
- has_one :records

