# BookMine
本のレビュー投稿アプリです<br>
就活用のポートフォリオとして作成中のものになります

## URL
https://bookmine.work

* ナビゲーションバー、もしくはログインページの【簡単ログイン】からテストユーザーとしてログインできます

## 開発環境
* Ruby 2.5.1
* Ruby On rails 5.2.3
* mysql 5.7
* Sass
* haml

## 機能、使用技術
* ユーザー登録・編集機能(devise)
* 書籍検索機能(GoogleBooks api)
* ユーザーフォロー機能
* ユーザー検索機能(ransack)
* ページネーション機能(kaminari)
* Bootstrap4を用いたレイアウト
* AWS
  * EC2
  * S3
  * Route53
  * ACM
* Capistrano
* Rspec
* jQuery

## 今後実装してきたいこと
* レビュー投稿機能(CRUD)
* dockerで開発環境の構築
* circleciの導入