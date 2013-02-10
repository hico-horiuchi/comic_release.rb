# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), '..', 'lib' ,'comic')
require "date"

describe Comic do
  before do
    @comic = Comic.new("TestTitle", "1")
  end

  describe ".to_s" do
    it "is_release_decidedがFalseの際、値が想定通りであること" do
      @comic.to_s.should eql 'TestTitle                                    01巻  未定'
    end

    it "is_release_decidedがTrueかつ発売日情報が収納されている際の値が想定通りであること" do
      @comic.instance_variable_set(:@is_release_decided, true)
      @comic.instance_variable_set(:@release_date, Date.strptime("11/11", "%m/%d"))
      @comic.to_s.should eql 'TestTitle                                    01巻  11/11'
    end
  end

  describe ".encorded_url" do
    it "encorded_urlの値が想定通りであること" do
      @comic.send(:encorded_url).should eql "http://comiclist.jp/index.php?p=s&mode=ss&keyword=TestTitle+1"
    end
  end
end
