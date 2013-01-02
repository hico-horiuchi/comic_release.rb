# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './lib/shelf.rb'
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

start = Time.now

shelf = Shelf.new
shelf.import(ARGV[0])
puts "Getting comics information."
shelf.resolv_books_attributes
shelf.each do |comic|
  puts comic.to_s.toutf8
end

finish = Time.now
puts "Exection time: "(finish - Start) + "s"
