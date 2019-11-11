# BookMine
本のレビュー投稿アプリです<br>
就活用のポートフォリオとして作成中のものになります

## URL
http://bookmine.work

* ナビゲーションバー、もしくはログインページの【簡単ログイン】からテストユーザーとしてログインできます

## 開発環境
* Ruby 2.5.1
* Ruby On rails 5.2.3
* mysql 5.7
* Sass
* haml

## 機能、使用技術
* ユーザー登録・ログイン機能(devise)
* 書籍検索機能(GoogleBooks api)
* Bootstrap4を用いたレイアウト
* AWS
  * EC2
  * Route53
* Capistrano
* jQuery

## 今後実装してきたいこと
* レビュー投稿機能(CRUD)
* レビュー検索機能(ransak)
* ページネーション機能(kaminari)
* ユーザーフォロー機能
* いいね機能
* ACM ELBでHTTPS化
* Rspecによるテスト
* dockerによる開発環境の構築
* circleciの導入