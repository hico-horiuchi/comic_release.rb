# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'date'
require 'kconv'

class Comic
  attr_reader :title, :volume, :release_date, :is_release_decided

  # 初期化
  def initialize(title, volume)
    @title = title
    @volume = volume.to_i
    @is_release_decided = false # 発売フラグ(release, undecide, error)

    # @volumeが整数でない場合
    if @volume == 0 then
      raise "volume が整数ではない"
    end
  end
end
