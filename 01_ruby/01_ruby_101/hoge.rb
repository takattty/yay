val = def hog
        "hey"
      end

# puts "heyhey" if val # val=hog
# if文で見てるのは、falseじゃないかどうかだな。
# で、falseじゃない理由はメソッドの定義の返り値は、メソッド名のシンボルになるはずだから。
# だから値があるからfalseじゃない。


class Hoge
  attr_accessor :piyo　# この子はゲッターとセッターの処理をまとめてる。
  def foo
    @piyo ||= "pio" # cherry P174 自己代入。 value ||= anything valueがnil or falseだとanythingを代入。
  end
end

hoge = Hoge.new
binding.irb
puts hoge.foo #=> piyo