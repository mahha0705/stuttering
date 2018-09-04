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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|sex|string|null: false|
|occupation|string|null: false|
|old|string|null: false|
|stuttering|string|null: false|
### Association
- has_many :questions
- has_many :answers
- has_many :thanks
- has_many :question_likes
- has_many :questions, through: :question_likes
- has_many :answer_likes
- has_many :answers, through: :answer_likes


## rails generate model
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|title|string|null: false|
|body|text|null: false|
### Association
- belongs_to :user
- has_many :answers
- has_many :question_likes
- has_many :users , through: :question_likes



## question_likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|question|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :question


## answersテーブル
|Column|Type|Options|
|------|----|-------|
|question|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|title|string|null: false|
|body|text|null: false|
### Association
- belongs_to :user
- belongs_to :thank
- has_many :answer_likes
- has_many :users , through: :answer_likes



## answer_likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|answer|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :answer


## thanksテーブル
|Column|Type|Options|
|------|----|-------|
|answer|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|title|string|null: false|
|body|text|null: false|

### Association
- belongs_to :user
- belongs_to :answer
