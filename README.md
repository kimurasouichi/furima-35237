# テーブル設計

## users テーブル

|     Column        |    Type   |   Options      |
| ---------------   | --------- | -------------- |
| nickname          | string    | null: false    |
| email             | string    | unique: true   |
| encrypted_password| string    | null: false    |
| last_name         | string    | null: false    |
| fist_name         | string    | null: false    |
| last_name_kana    | string    | null: false    |
| fist_name_kana    | string    | null: false    |
| birth_day         | date      | null: false    |
 
### Association

- has_many :deliverys
- has_many :items


## deliverys テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| post_code      | string      | null: false        |
| prefecture     | string      | null: false        |
| city           | string      | null: false        |
| address        | string      | null: false        |    
| building_name  | string      |                    |
| phone_number   | string      | null: false        |
| user_id        | references  | foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user


## items テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| name           | string      | null: false        |
| description    | text        | null: false        |
| category       | string      | null: false        |
| condition_id   | integer     | null: false        |
| burden_id      | integer     | null: false        |
| area_id        | integer     | null: false        |
| day_id         | integer     | null: false        |
| price          | integer     | null: false        |
| user           | references  | foreign_key: true  |

### Association

- has_one :purchase
- belongs_to :user


## purchase テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| delivery_id    | references  | foreign_key: true  |
| item_id        | references  | foreign_key: true  |

### Association

- belongs_to :delivery
- belongs_to :item