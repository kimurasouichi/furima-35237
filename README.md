# テーブル設計

## users テーブル

|     Column       |    Type   |   Options      |
| ---------------  | --------- | -------------- |
| nickname         | string    | null: false    |
| email            | string    | null: false    |
| password         | string    | null: false    |
| last_name        | string    | null: false    |
| fist_name        | string    | null: false    |
| last_name_kana   | string    | null: false    |
| fist_name_kana   | string    | null: false    |
| birth_day        | date      | null: false    |

### Association

- has_one : card
- has_one : delivery
- has_many :items


## deliverys テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| post_code      | string      | null: false        |
| prefecture     | string      | null: false        |
| city           | string      | null: false        |
| address        | string      | null: false        |    
| building_name  | string      | null: false        |
| phone_number   | string      | null: false        |
| user_id        | references  | foreign_key: true  |

### Association

- belongs_to user


## crads テーブル

|     Column     |    Type     |     Options       |
| -------------- | ----------- | ----------------- |
| user_id        | references  | foreign_key: true |
| card_id        | string      | null: false       |

### Association

- belongs_to :user


## items テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| name           | string      | null: false        |
| description    | text        | null: false        |
| category       | string      | null: false        |
| condition      | string      | null: false        |
| delivery_burden| string      | null: false        |
| shipping_area  | string      | null: false        |
| shipping_days  | string      | null: false        |
| price          | string      | null: false        |
| user_id        | references  | foreign_key: true  |

### Association

- belongs_to :user
- has_many :images


## images テーブル

|    Column      |    Type     |      Options       |
| ------------   | ----------  | ------------------ |
| name           | string      | null: false        |
| user_id        | references  | foreign_key: true  |

### Association

- belongs_to :user