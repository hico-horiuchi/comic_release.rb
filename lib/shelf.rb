# -*- coding: utf-8 -*-

Encoding.default_external = 'UTF-8'

require File.join(File.dirname(__FILE__), 'comic.rb')
require File.join(File.dirname(__FILE__), 'thread_pool.rb')

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

  def each
    @comics.each do |comic|
      yield comic
    end
  end

  def resolve_books_attributes
    thread_pool =  ThreadPool.new(10)
    @comics.each do |comic|
      thread_pool.run do
        comic.resolve_release_date!
      end
    end
    thread_pool.join
  end

  private
  def add(title, volume)
    @comics << Comic.new(title, volume)
    self
  end
end
