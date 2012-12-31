# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './just_kana.rb'
require './comic_list.rb'
require 'optparse'

encoding = 'sjis'

opt = OptionParser.new
opt.on('-u') {|v| encoding = 'utf8' }
opt.parse!(ARGV)

if ARGV.size < 1
  puts "引数不足"
  puts "usage: ruby ./comic_release.rb ./foo.csv"
  exit
end

CSV.foreach(ARGV[0]) { |raw|
  comic = ComicList.new(raw[0], raw[1])

  str = comic.title.left_justify(35)
  str += "%02d" % comic.volume + "巻  "

  if comic.is_release_decided
    str += comic.release_date.strftime("%m/%d")
  else
    str += "未定"
  end

  if encoding == 'utf8'
    puts str.toutf8
  else
    puts str.tosjis
  end
}
