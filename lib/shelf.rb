# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require File.join(File.dirname(__FILE__), 'comic.rb')

class Shelf
  include Enumerable
  attr_accessor :comics

  def initialize
    @comics = []
  end

  def import(csv)
    CSV.foreach(csv) do |line|
      add(line[0], line[1])
    end
  end

  def add(title, volume)
    @comics << Comic.new(title, volume)
    self
  end

  def each
    @comics.each do |comic|
      yield comic
    end
  end

  #TODO ここの処理が遅いので並列処理を検討すべき
  def resolv_books_attributes
    @comics.each do |comic|
      comic.resolv_release_date!
    end
  end
end
