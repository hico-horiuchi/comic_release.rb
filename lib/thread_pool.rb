# -*- coding: utf-8 -*-
# 固定数のスレッドで並行処理をサポートする Ruby コード。 - 自分の歩いた道に落ちてるコード
# http://www.ownway.info/Blog/2012/01/mail2weblog-6.html

class ThreadPool
  def initialize(count, logger = nil)
    @count = count
    @number = 0
    @index = 1
    @logger = logger
  end

  def run(&block)
    @logger.debug("Start  #{self.class.name}#run ... index = #{@index}, number = #{@number}") if @logger
    while true
      if @number < @count then
        break
      end
      Thread.pass
    end
    @number += 1
    @index += 1
    Thread.new do
      begin
        block.call
      rescue Exception => e
        @logger.error(e)
      ensure
        @number -= 1
        @logger.debug("Finish #{self.class.name}#run ... index = #{@index}, number = #{@number}") if @logger
      end
    end
  end

  def join
    @logger.debug("Start  #{self.class.name}#join ... index = #{@index}, number = #{@number}") if @logger
    while true
      if @number == 0 then
        break
      end
      Thread.pass
      @logger.debug("#{self.class.name}#join waiting ... index = #{@index}, number = #{@number}") if @logger
    end
    @logger.debug("Finish #{self.class.name}#join ... index = #{@index}, number = #{@number}") if @logger
  end
end
