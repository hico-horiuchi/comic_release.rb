# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'date'
require 'kconv'

class Comic
  attr_reader :title, :volume, :release_date, :flag

  # 初期化
  def initialize(title, volume)
    @title = title
    @volume = volume.to_i
    @release_date
    @flag = "undecide"  # 発売フラグ(release, undecide, error)

    # numが整数でない場合
    if volume == 0 then
      @flag = "error"
    end
  end
end
