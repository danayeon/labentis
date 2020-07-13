# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# labentis DB設計
## Projectsテーブル
|Column        |Type      |Option                   |
|--------------|----------|-------------------------|
|title         |string    |null: false              |
|statement     |text      |null: false              |
|track_user_id |references|foreign_key: true        |
|lyric_user_id |references|foreign_key: true        |
|singer_user_id|references|foreign_key: true        |
|video_user_id |references|foreign_key: true        |
|manage_usre_id|references|foreign_key: true        |
|link          |string    |unipue: true             |
|overview      |text      |                         |
|upload_at     |datatime  |                         |
|created_at    |timestamp |null: false              |

### Association
 - belongs_to :user
 - has_many   :messages
 - has_many   :parts
 - has_many   :matches

## Usersテーブル
|Column  |Type  |Option                   |
|--------|------|-------------------------|
|name    |string|null: false              |
|email   |string|null: false, unique: true|
|password|string|null: false              |
|image   |string|                         |

### Association
 - has_many   :projects
 - has_many   :parts
 - has_many   :messages
 - has_many   :matches

## Matchesテーブル
|Column    |Type      |Option                        |
|----------|----------|------------------------------|
|project_id|references|null: false, foreign_key: true|
|user_id   |references|null: false, foreign_key: true|
|track     |integer   |                              |
|lyric     |integer   |                              |
|singer    |integer   |                              |
|video     |integer   |                              |
|permission|integr    |                              |
|comment   |text      |                              |

### Association
 - belongs_to :project
 - belongs_to :user

## Partsテーブル
|Column    |Type      |Option                        |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|project_id|references|null: false, foreign_key: true|
|file      |??        |null: false, foreign_key: true|
|created_at|timestamp |null: false                   |
|name      |string    |null: false                   |

### Association
 - belongs_to :user
 - belongs_to :project

## Messagesテーブル
|Column    |Type      |Option                        |
|----------|----------|------------------------------|
|user_id   |references|null: false, foreign_key: true|
|project_id|references|null: false, foreign_key: true|
|Content   |text      |null: false                   |
|created_at|timestamp |null: false                   |

### Association
 - belongs_to :user
 - belongs_to :project

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
