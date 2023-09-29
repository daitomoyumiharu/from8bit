# from8bit


## アプリケーション概要
ゲーム音楽を投稿、共有できるプラットフォームです。ユーザーはジャンルや年代別、またはオリジナル楽曲として楽曲を分類して投稿できます。

## URL
https://from8bit.onrender.com

## テスト用アカウント
- Email: test@example.com
- Password: password123
- Basic認証 ID: admin
- Basic認証 Pass: 2222

## 利用方法
1. ユーザー登録を行う
2. ログイン後、楽曲の投稿が可能(投稿の編集、削除機能を実装)
3. ジャンルや年代を選択して投稿、任意投稿として楽曲を聞いて欲しい人やオススメできる点を紹介する投稿を追加
4. 他のユーザーの楽曲を探索、聞くことができる

## アプリケーションを作成した背景
製作者自身ゲーム音楽により勇気付けられた経験や感動した経験から、ゲーム音楽の素晴らしさを共有できるコミュニティサービスを目指し作成致しました。
また、世界中のゲーム音楽を愛する人たちが楽曲を共有することで新しい発見が生まれ感動の共有が出来ると考えました。
オリジナル楽曲の投稿については、ゲームからインスピレーションを得た楽曲を投稿できることで更にゲーム音楽への親しみが生まれると思い追加致しました。



## 洗い出した要件
https://docs.google.com/spreadsheets/d/1200ahj6Q-p_z3T8ugmMPSsQAN_3CTmoEd2ZVIc77xkM/edit#gid=982722306

## 実装した機能についての画像やGIFおよびその説明
- 機能1の説明 ![機能1の画像](URL)（実装後記載致します）
- 機能2の説明 ![機能2のGIF](URL)（実装後記載致します）

## 実装予定の機能
- コメント機能
- ランキング表示
- 動画投稿機能

## データベース設計
![ER図のURL][![Image from Gyazo](https://i.gyazo.com/33ac4d9d3ad7d438f8eccce0347887c4.png)](https://gyazo.com/33ac4d9d3ad7d438f8eccce0347887c4)

## 画面遷移図
![画面遷移図のURL][![Image from Gyazo](https://i.gyazo.com/5aa68a0fe114a2d8a2fce192467a3204.png)](https://gyazo.com/5aa68a0fe114a2d8a2fce192467a3204)

## 開発環境
- Ruby 3.2.0
- Rails 7.0.0
- SQLite3 (開発環境)
- PostgreSQL (本番環境)

## ローカルでの動作方法
$ git clone [https://github.com/daitomoyumiharu]
$ cd [from8bit]
$ bundle install
$ rails db:create db:migrate
$ rails s

## 工夫したポイント
- 楽曲の投稿内容にオススメできる点や聞いて欲しい対象を追加することで、投稿者が何を意図して投稿したものか明示化できます。
- オリジナル楽曲を投稿できる事で、ゲーム音楽を制作したいと考えている方達がアウトプット出来る場所を提供できると考えました。
- 年代別の投稿ができる事で、過去のゲーム音楽への興味が湧くとともに最新のゲーム音楽も聞いてみようとユーザーが幅広く楽曲への関心が持てるように設計しました。

## 改善点
- UIの向上
- マネタイズ方法の立案

## 制作時間
約 時間（制作中です）


### users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| id                 | integer | primary key               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

#### Association

- has_many :musics
- has_many :likes
- has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id'
- has_many :follows_as_following, class_name: 'Follow', foreign_key: 'following_id'
- has_many :followers, through: :follows_as_following, source: :follower
- has_many :followings, through: :follows_as_follower, source: :following 

<br>

### musics テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| id               | integer    | primary key                    |
| user_id          | references | null: false, foreign_key: true |
| game_name        | string     | null: false,                   |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| music_file       | string     | null: false                    |
| year_id          | integer    | null: false                    |
| genre_id         | integer    | null: false                    |
| target           | text       |                                |



#### Association

- belongs_to :user
- has_many :comments
- has_many :likes


<br>

### comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| id               | integer    | primary key                    |
| music_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |
| text             | text       | null: false                    |

#### Association

- belongs_to :user
- belongs_to :music


<br>

### likes テーブル

| Column        | Type           | Options                                        |
| ------------- | -------------- | ---------------------------------------------- |
| id            | integer        | primary key                                    |
| user_id       | references     | null: false, foreign_key: { to_table: :users } |
| music_id      | references     | null: false, foreign_key: { to_table: :users } |


#### Association

- belongs_to :user
- belongs_to :music

<br>

### follows テーブル

| Column         | Type       | Options                                        |
| -------------- | ---------- | ---------------------------------------------- |
| id             | integer    | primary key                                    |
| follower_id    | references | null: false, foreign_key: { to_table: :users } |
| following_id   | references | null: false, foreign_key: { to_table: :users } |


#### Association

- belongs_to :follower, class_name: 'User'
- belongs_to :following, class_name: 'User'
