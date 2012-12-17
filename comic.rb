# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'date'
require 'kconv'

class Comic
  attr_reader :name, :num, :release_date, :flag

  # 初期化
  def initialize(name, num)
    @name = name        # タイトル
    @num = num.to_i     # 巻数
    @release_date = Date::today # 発売日
    @flag = "undecide"  # 発売フラグ(release, undecide, error)

    # numが整数でない場合
    if num == 0 then
      @flag = "error"
    end

    @url = encodeURL(@name, @num)
    @release_date = getReleaseDate(@url)
  end

end
