# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'date'
require 'kconv'

class Comic
  # 初期化
  def initialize(name, num)
    @name = name        # タイトル
    @num = num.to_i     # 巻数
    @date = Date::today # 発売日
    @flag = "undecide"  # 発売フラグ(release, undecide, error)

    # numが整数でない場合
    if num == 0 then
      @flag = "error"
    end

    @url = encodeURL(@name, @num)
    @date = getReleaseDate(@url)
  end

  # データ取得メソッド
  def getName
    @name
  end

  def getNum
    @num
  end

  def getDate
    @date
  end

  def getFlag
    @flag
  end
end
