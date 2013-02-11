# -*- coding: utf-8 -*-

require 'csv'
require File.join(File.dirname(__FILE__), '..', 'lib' ,'shelf')

describe Shelf do
  before do
    @shelf = Shelf.new
  end
  describe ".import" do
    before do
      @shelf.import "./spec/list.csv"
    end

    it "comicインスタンスが3つあること" do
      @shelf.comics.length.should == 3
    end

    it "インスタンスの1つめが想定した値をもっていること" do
      @shelf.comics[0].title.should == "テスト書籍"
      @shelf.comics[0].volume == 1
    end
  end

  describe ".add" do
    before do
      @shelf.send(:add, "COMIC", "2")
    end
    
    it "comicsの数が1つになっていること" do
      @shelf.comics.length.should == 1
    end

    it "正しい値が追加されること" do
      @shelf.comics[0].title.should == "COMIC"
    end
  end


  describe ".each" do
    before do
      @shelf.import "./spec/list.csv"
    end

    it "comicsが一つずつ返却されること" do
      expected = ["テスト書籍", "テストテスト書籍", "テストテストテスト書籍"]
      count = 0
      @shelf.each do |comic|
        comic.title.should == expected[count]
        count = count + 1
      end
    end
  end
end
