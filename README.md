# DB 設計

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string            |  null: false           |
| email              | string            |  null: false,unique: true           |
| encrypted_password | string            |  null: false           |
| last_name          | string            |  null: false           |
| first_name         | string            |   null: false          |
| last_name_kana     | string            |  null: false           |
| first_name_kana    | string            |  null: false           |
| birthday           | date              |  null: false           |

### Association
* has_many :items
* has_many :records

 


## items table
| Column                                 | Type       | Options                              |
|-------------------------------------   |------------|------------------                    |
| name                                   | string     | null: false                          |
| category_id                            | integer    | null: false                          |
| explanation                            | text       | null: false                          |
| price                                  | integer     | null: false                          |
| status_id                              | integer     | null: false                          |
| shipping_id                            | integer     | null: false                          |
| shipping-place_id                      | integer     | null: false                          |
| date_shipment_id                       | integer    | null: false                          |
| user                                   | references     | null: false                          |


### Association
- has_one :record
- belongs_to :user



## records table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | null: false, foreign_key: true       |
| item        | references | null: false, foreign_key: true       |


### Association
- belongs_to :user
- belongs_to :item
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
| record         | references     | null: false       |



### Association
- belongs_to :record


t.name
t.category_id
t.explanation
t.price
t.status_id
t.shipping_id
t.shipping-place_id
t.date_shipment_id
t.user
