# DB design

## users table

|Column|Type|Option|
|------|----|------|
|nickname|string|index: true, null: false, unique: true|
|phone_number|integer|null: false|
|email|string|default: "", null: false, unique: true|
|password|string|default: "", null: false|
|icon_image|srtring||
|background_image|string||
|birth_year|integer||
|birth_month|integer||
|birth_day|integer||
|profile|text||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Assocation

- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destoroy
- has_many :authorizations, dependent: :destroy
- has_many :buyer_products, class_name: 'Product', foreign_key: 'buyer_id'
- has_many :seller_products, class_name: 'Product', foreign_key: 'seller_id'
- has_many :purchase_histories, foregin_key: :purchase_id

## adresses table

|Column|Type|Option|
|------|----|------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block_number|string|null: false|
|building_name|string||
|user_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association

- belongs_to :user

## authorizations table

|Column|Type|Option|
|------|----|------|
|uid|string|null: false|
|provider|string|null: false|
|user_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association

- belongs_to :user

## credit_cards table
|Column|Type|Option|
|------|----|------|
|card_number|string|null: false, unique: true|
|security_code|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|intrger|null: false|
|user_id|bigint|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user

## products table

|Column|Type|Option|
|------|----|------|
|name|string|index: true, null: false|
|detail|text||
|shipping_fee|integer||
|expected_date|integer||
|price|integer|index: true, null: false|
|user_id|bigint|null: false, foreign_key: true|
|brand_id|integer|null: false, forein_key: true|
|like_count|integer|default: 0|
|status|string|null: false|
|size|string|null: false|
|purchaser_id|integer||
|category_id|integer|null: false, foreign_key: true|
|subcategory_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false: foreign_key: true|
|subitem_id|integer|foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|
|shipping_from|string|null: false|
|shipping_method|integer|null: false|
|purchased|boolean|default: false, null: false|
|published|boolean|default: true, null: false|

### Association

- belongs_to :user_product
- belongs_to :category_products
- has_many :payments
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :category, through: category_products
- has_many :users, through: user_products
- has_many :images, class_name: "ProductImage", dependent: :destroy
- has_one :purchase_history

## product_images table
|Column|Type|Option|
|------|----|------|
|image|string|null: false|
|product_id|bigint||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Assocation

- belongs_to :product

## likes table

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false|
|product_id|integer|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association

- belongs_to :product, counter_cache: :likes_count
- belongs_to :user

## categories table

### gem ancestryを使用

|Column|Type|Option|
|------|----|------|
|name|string|index: true|
|ancestry|string|index: true|

### Association

- has_many: products
- has_ancestry

## brands table

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association

- has_many :products

## sizes table

|Column|Type|Option|
|------|----|------|
|size|string|null: false|

### Association

- has_many :products

## sell_status

|Column|Type|Option|
|------|----|------|
|status|integer|null: false|

### Association

- has_many :products
*---
