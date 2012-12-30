comic_release.rb
================
コミック新刊の発売日を調べるRubyスクリプトです。
現在は、[comiclist.jp](http://comiclist.jp/)から、情報を取得しています。

使用方法
--------
	> ruby comic_release.rb list.csv

変数一覧
--------
+ Comic
	+ `title` : タイトル
	+ `volume` : 巻数
	+ `is_release_decided` : 発売フラグ
+ ComicList
	+ `url` : 検索用URL
	+ `release_daye` : 発売日

メソッド一覧
============
+ ComicList
	+ `create_encode_url` : titleとvolumeから、UTF-8エンコードで検索用のURLを生成。
	+ `get_release_date` : URLからHTMLを取得し、正規表現を用いて発売日を取得。

クラス図
--------
![class.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/class.png)

シーケンス図
------------
![sequence.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/sequence.png)
