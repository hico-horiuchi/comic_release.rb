# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './just_kana.rb'
require './comic_list.rb'

if ARGV.size < 1
  puts "引数不足"
  puts "usage: ruby ./comic_release.rb ./foo.csv"
  exit
end

CSV.foreach(ARGV[0]) { |raw|
  comic = ComicList.new(raw[0], raw[1])

  print(comic.title.left_justify(30).tosjis)

  printf("%02d", comic.volume)
  print("巻  ".tosjis)

  if comic.is_release_decided
    print(comic.release_date.strftime("%m/%d") + "\n")
  else
    puts "未定".tosjis
  end
}
