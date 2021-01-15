# Studyappのデータベース設計

## usersテーブル

| Column   | Type   | Options     
| -------- | ------ | ----------- 
| nickname | string | null: false 
| email    | string | null: false 
| password | string | null: false 

### Association

has_many :diaries
has_many :methods
has_many :options
has_many :others

## diariesテーブル

| Column    | Type       | Options           
| --------- | -------    | -----------------
| title     | string     | null: false
| text      | text       | null: false
| year_id   | integer    | null: false
| month_id  | integer    | null: false
| day_id    | integer    | null: false
| hour_id   | integer    | null: false
| minute_id | integer    | null: false
| url_text  | string     |
| user      | references | foreign_key: true

### Association

belongs_to :user

## mannersテーブル

| Column   | Type       | Options     
| -------- | ---------- | ----------- 
| name     | string     | null: false 
| text     | text       | null: false 
| url_text | string     |
| user     | references | foreign_key: true

### Association

belongs_to :user

## optionsテーブル

| Column   | Type       | Options
| -------- | ---------- | ----------- 
| name     | string     | null: false
| text     | text       | null: false
| url_text | string     |
| user     | references | foreign_key: true

### Association

belongs_to :user

## expressionsテーブル

| Column   | Type       | Options
| -------- | ---------- | ----------- 
| name     | string     | null: false
| text     | text       | null: false
| url_text | string     |
| user     | references | foreign_key: true

### Association

belongs_to :user

## othersテーブル

| Column | Type       | Options
| ------ | ---------- | -----------
| title  | string     | null: false
| user   | references | foreign_key: true

### Association

belongs_to :user
has_many :other_texts

## other_textsテーブル

| Column   | Type       | Options
| -------- | ---------- | -----------
| text     | text       | null: false
| url_text | string     |
| other    | references | foreign_key: true

### Association

belongs_to :other