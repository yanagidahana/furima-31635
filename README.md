# DB 設計

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string            |  null: false           |
| email              | string            |  null: false           |
| password           | string            |  null: false           |


### Association
* has_many :items
* has_many :records



## items table
| Column                              | Type       | Options                              |
|-------------------------------------|------------|------------------                    |
| name                                | string     | null: false                          |
| price                               | integer    | null: false                          |
| brand_id                            | references | foreign_key:true                     |
| item_conditions_id                  | references | null: false, foreign_key: true       |
| buyer_id                            | references | foreign_key: true                    |


### Association
- has_one :record
* has_many :users
- belongs_to :buyer_id




## records table
| Column      | Type       | Options           |
|-------------|------------|-------------------|
| name        | string     | null: false                         |
| seller_id   | references | null: false, foreign_key: true       |

### Association
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
| building      | string     | null: false       |


### Association
- has_one :records

