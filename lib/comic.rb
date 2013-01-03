# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'date'
require 'kconv'
require 'cgi'
require 'open-uri'

require File.join(File.dirname(__FILE__), './just_kana.rb')

class Comic
  attr_reader :title, :volume, :release_date, :is_release_decided

  # 初期化
  def initialize(title, volume)
    @title = title
    @volume = volume.to_i
    @is_release_decided = false

    # @volumeが整数でない場合
    if @volume == 0 then
      raise "volume が整数ではない"
    end
  end

  #FIXME 情報の取得をこのクラス内でやってしまうのは違和感があるので、
  #規模が大きくなってきたら分離すべき
  def resolv_release_date!
    @release_date = Date::today
    open(encorded_url) do |f|
      f.read =~ /<td class="list-line list-day">(.*?)<\/td>/
      if $1 then # 発売日が決定の場合
        @release_date = Date.strptime($1, "%m/%d")
        @is_release_decided = true
      end
    end
  end

  def to_s
    str = @title.left_justify(35)
    str += "%02d" % @volume + "巻  "
    if @is_release_decided
      str += @release_date.strftime("%m/%d")
    else
      str += "未定"
    end
    return str
  end

  private
  def encorded_url
    return 'http://comiclist.jp/index.php?p=s&mode=ss&keyword=' + CGI.escape(@title.toutf8) + '+' + @volume.to_s
  end
end
