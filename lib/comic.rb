# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'bundler/setup'
require 'date'
require 'kconv'
require 'cgi'
require 'open-uri'
require 'nokogiri'

require File.join(File.dirname(__FILE__), './just_kana.rb')

class Comic
  attr_reader :title, :volume, :release_date, :is_release_decided

  # タイトルと巻数を初期化
  def initialize(title, volume)
    @title = title                 # タイトル
    @volume = volume.to_i          # 巻数
    @is_release_decided = false    # 発売フラグ(true:決定,false:未定)

    # @volumeが不正な値
    if @volume <= 0 then
      raise "volume: invalid value"
    end
  end

  # FIXME 情報の取得をこのクラス内でやってしまうのは違和感があるので、
  # 規模が大きくなってきたら分離すべき
  def resolve_release_date!
    @release_date = nil  # 発売日をnilで初期化
    # 検索用ウェブページを開いて発売日を抽出
    html = Nokogiri::HTML(open(encode_url))
    # 発売日を格納
    @release_date = Date.strptime(html.css('td.list-line.list-day').first.text, "%m/%d")
    # 発売フラグ更新
    @is_release_decided = true if @release_date != nil
  end

  # 出力する文字列の生成
  def to_s
    str = @title.left_justify(45)             # タイトル(35文字左詰め)
    str += "%02d" % @volume + "巻  "          # 巻数(0付き2桁)
    if @is_release_decided                    # 発売決定の場合
      str += @release_date.strftime("%m/%d")  # 発売日(月/日)
    else                                      # 発売未定の場合
      str += "未定"
    end
    return str
  end

  # 検索用ウェブページのURLを生成
  private
  def encode_url
    # comiclist.jpで検索
    return 'http://comiclist.jp/index.php?p=s&mode=ss&keyword=' + CGI.escape(@title.toutf8) + '+' + @volume.to_s
  end
end
