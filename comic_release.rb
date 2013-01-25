# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require 'csv'
require 'kconv'
require './lib/shelf.rb'
require 'optparse'

# デフォルトの出力文字コードはShift_JIS
encoding = 'sjis'

# オプションの解析
opt = OptionParser.new
# -uオプションで出力文字コードをUTF-8に
opt.on('-u') {|v| encoding = 'utf8' }
opt.parse!(ARGV)

# コマンドライン引数のチェック
# 漫画リスト(CSV)が必要なため引数は1個以上
if ARGV.size < 1
  puts "引数不足"
  puts "usage: ruby ./comic_release.rb ./foo.csv"
  exit
end

start = Time.now  # 処理時間の計測開始

shelf = Shelf.new
shelf.import(ARGV[0])               # 漫画リスト(CSV)の読み込み
puts "Getting comics information."
shelf.resolve_books_attributes      # 発売日を取得
shelf.each do |comic|               # リストの漫画について
  if comic.is_release_decided       # 発売日が決定している場合
      puts comic.to_s               # タイトル,巻数,発売日を出力
  end
end

# 処理時間の計測終了と結果の出力
finish = Time.now
puts "Execution time: " + (finish - start).to_s + "s"
