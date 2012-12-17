comic_release.rb
================
コミック新刊の発売日を調べるRubyスクリプトです。
現在は、[comiclist.jp](http://comiclist.jp/)から、情報を取得しています。

使用方法
--------
	> ruby comic_release.rb list.csv

変数一覧
--------
+ `name` : タイトル
+ `num` : 巻数
+ `date` : 発売日
+ `flag` : 発売フラグ(release, undecide, error)
+ `url` : 検索用URL

クラス図
--------
![class.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/class.png)

シーケンス図
------------
![sequence.png](https://raw.github.com/hico-horiuchi/comic_release.rb/master/sequence.png)
