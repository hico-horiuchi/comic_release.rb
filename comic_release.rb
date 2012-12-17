# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './just_kana.rb'
require './comic_list.rb'

CSV.foreach(ARGV[0]) { |raw|
  tmpComic = ComicList.new(raw[0], raw[1])

  print(ljust_kana(tmpComic.name, 25).tosjis)

  printf("%02d", tmpComic.num)
  print("巻  ".tosjis)

  flag = tmpComic.flag
  if flag == "release" then
    print(tmpComic.date.strftime("%m/%d") + "\n")
  elsif flag == "undecide" then
    puts "未定".tosjis
  else
    puts "エラー".tosjis
  end
}
