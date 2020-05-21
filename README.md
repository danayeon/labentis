# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# labentis DB設計
## projectsテーブル
|Column    |Type     |Option                   |
|----------|---------|-------------------------|
|team_id   |integer  |null: false, foreign_key |
|product_id|integer  |null: false, foreign_key |
|title     |string   |null: false              |
|link      |string   |null: false, unipue: true|
|overview  |text     |null: false              |
|reported  |integer  |                         |
|alert     |integer  |                         |
|created_at|timestamp|null: false              |
|update_at |timestamp|null: false              |
|upload_at |datatime |null: false              |
### Association
 - belongs_to :team
 - belongs_to :product
 - has_many   :users,         through: :users_projects
 - has_many   :users_projects
 -
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
