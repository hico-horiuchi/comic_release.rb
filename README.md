comic_release.rb
================
[![Build Status](https://travis-ci.org/hico-horiuchi/comic_release.rb.svg?branch=master)](https://travis-ci.org/hico-horiuchi/comic_release.rb)

コミック新刊の発売日を調べるRubyスクリプトです。
現在は、[comiclist.jp](http://comiclist.jp/)から、情報を取得しています。

初回起動時
--------
	> gem install bundler
	> bundle install --path=vendor/bundle

起動方法
--------
	> ruby comic_release.rb list.csv

ユニットテスト
--------
	> rake spec

変数一覧
--------
+ Comic
	+ `title` : タイトル
	+ `volume` : 巻数
	+ `release_date` : 発売日
	+ `is_release_decided` : 発売フラグ
+ Shelf
	+ `comics` : Comicインスタンス収納配列

メソッド一覧
------------
+ Comic
	+ `encorded_url` : titleとvolumeから、UTF-8エンコードで検索用のURLを生成。
	+ `resolve_release_date!` : URLからHTMLを取得し、正規表現を用いて発売日を取得。
	+ `to_s` : 出力文字列を生成
+ Shelf
	+ `import` : 与えられたパスからCSVを読み込み、行ごとにaddメソッドを実行。
	+ `add` : Comicインスタンスを作成し、comics配列へ収納
	+ `each` : comics配列の中身を一つずつ返す。
	+ `resolve_books_attributes` : comics配列に収納されているComicインスタンスすべてにresolv_release_date!メソッドを実行。
