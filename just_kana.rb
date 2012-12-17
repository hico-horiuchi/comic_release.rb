# -*- coding: utf-8 -*-
# RubyとPythonで全角文字を半角文字2文字として数える - _dog(underdog)
# http://d.hatena.ne.jp/hush_puppy/20090226/1235661269

class String
  # 左寄せ
  def left_justify(size, pad = " ")
    str = self
    space = size - self.width_kana
    if space > 0
      str += pad * space
    end
    return str
  end

  # 幅(半角基準)
  def width_kana
    all = self.scan(/./u).size # 全文字数
    zenkaku = self.count_zen  # 全角文字数
    hankaku = all - zenkaku   # 半角文字数
    return zenkaku * 2 + hankaku
  end

  # 全角文字数(不完全)
  def count_zen
    all = self.scan(/./u).size       # 全文字数
    ascii = self.scan(/[ -~]/u).size # ASCII文字数
    kana = self.scan(/[｡-ﾟ]/u).size  # 半角かな文字数
    return all - (ascii + kana)
  end
end
