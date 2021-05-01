# テーブル設計

## users テーブル

|     Column        |    Type   |           Options           |
| ---------------   | --------- | --------------------------  |
| nickname          | string    | null: false                 |
| email             | string    | null: false, unique: true   |
| encrypted_password| string    | null: false                 |
| last_name         | string    | null: false                 |
| fist_name         | string    | null: false                 |
| last_name_kana    | string    | null: false                 |
| first_name_kana   | string    | null: false                 |
| birth_day         | date      | null: false                 |
 
### Association

- has_many :purchases
- has_many :items


## orders テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| post_code      | string      | null: false        |
| area_id        | integer     | null: false        |
| city           | string      | null: false        |
| address        | string      | null: false        |    
| building_name  | string      |                    |
| phone_number   | string      | null: false        |
| purchase       | references  | foreign_key: true  |

### Association

belongs_to :purchase


## items テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| name           | string      | null: false        |
| description    | text        | null: false        |  
| category_id    | integer      | null: false        |
| condition_id   | integer     | null: false        |
| burden_id      | integer     | null: false        |
| area_id        | integer     | null: false        |
| day_id         | integer     | null: false        |
| price          | integer     | null: false        |
| user           | references  | foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| user           | references  | foreign_key: true  |
| item           | references  | foreign_key: true  |

### Association

- has_one :delivery
- belongs_to :item
- belongs_to :user
