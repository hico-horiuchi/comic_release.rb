# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './just_kana.rb'
require './comic_list.rb'

CSV.foreach(ARGV[0]) { |raw|
  tmpComic = ComicList.new(raw[0], raw[1])

  print(ljust_kana(tmpComic.title, 25).tosjis)

  printf("%02d", tmpComic.volume)
  print("巻  ".tosjis)

  if tmpComic.is_release_decided
    print(tmpComic.release_date.strftime("%m/%d") + "\n")
  else
    puts "未定".tosjis
  end
}
