# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'cgi'
require 'open-uri'
require './comic.rb'

class ComicList < Comic
  # タイトルと巻数からURLを生成
  def encodeURL(name, num)
    # URLエンコード
    return 'http://comiclist.jp/index.php?p=s&mode=ss&keyword=' + CGI.escape(@name.toutf8) + '+' + @num.to_s
  end

  # URLから発売日を取得
  def getReleaseDate(url)
    releaseDate = Date::today

    # HTMLファイル取得
    open (url) { |f|
      # 1行ずつ読み込み、正規表現で発売日を抽出
      f.read =~ /<td class="list-line list-day">(.*?)<\/td>/
      if $1 then # 発売日が決定の場合
        releaseDate = Date.strptime($1, "%m/%d")
        @flag = "release"
      end
    }
    return releaseDate
  end
end
