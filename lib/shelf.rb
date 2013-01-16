# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require File.join(File.dirname(__FILE__), 'comic.rb')
require File.join(File.dirname(__FILE__), 'thread_pool.rb')

class Shelf
  include Enumerable
  attr_accessor :comics

  # 初期化
  def initialize
    @comics = []  # Comicインスタンス収納配列
  end

  # 漫画リスト(CSV)の読み込み
  def import(csv)
    # 行ごとにaddメソッドを実行
    CSV.foreach(csv) do |line|
      add(line[0], line[1])
    end
  end

  # comics配列の中身を一つずつ返却
  def each
    @comics.each do |comic|  # comis配列の全てについて
      yield comic            # Comicインスタンスを返却
    end
  end

  # comics配列に収納されているComicインスタンス全ての発売日を取得
  def resolve_books_attributes
    thread_pool =  ThreadPool.new(10)  # 10個のスレッドで処理
    @comics.each do |comic|            # comics配列の全てについて
      thread_pool.run do               # スレッドを生成して実行
        comic.resolve_release_date!    # 発売日を取得
      end
    end
    thread_pool.join                   # 全スレッドの処理待ち
  end


  # Comicインスタンスを作成しcomics配列へ収納
  private
  def add(title, volume)
    @comics << Comic.new(title, volume)
  end
end
