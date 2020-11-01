# Enumerableモジュール
# 繰り返しを行うクラスの為のMix-in。
# 配列やハッシュ、範囲等の繰り返し処理が可能なクラスにincludeされている。
# 現時点で知っているのは、mapやfind,first,to_a,to_h,とか。

def generate_proc(array)
  counter = 0
  # Procオブジェクトをメソッドの戻り値とする
  Proc.new do
    # ローカル変数のcounterを加算
    counter += 10
    # メソッド引数のarrayにcounterの値を追加
    array << counter
  end
end

# つまりメソッドが生成された時（9行目）のコンテキストを保持しているメソッドはgenerate_proc。なのでこいつがクロージャー。
values = []
p values
# ↓ここがProcオブジェクトを生成して返すメソッド。でコンテキストは多分counterやその処理を指す部分。
sample_proc = generate_proc(values)
p "generate_proc", generate_proc(values) 
# =>#<Proc:0x00007fa48f9e0b20@blockPractice.rb:9> Procって書かれてる！
p values # []
sample_proc.call
p values # [10]
sample_proc.call
p values # [10, 20]


# practice yield
def dice
  if block_given?
    p "run block"
    yield
  else
    p "normal dive"
    p [1, 2, 3, 4, 5, 6].sample
  end
end

# ブロックを渡さないメソッド呼び出し
dice

# ブロックを一つしか渡せないので、一つ渡すメソッド呼び出し
dice do
  p [4, 5, 6].sample
end


# Practice call method
def foo(&b) # &b = block
  b.call # call is run block function
  p b.class # => Prock object
end

foo do
  p "Chunky bacon!!"
end

# Define a method to receive a block

def triple(arg, &blk)
  acc = arg
  3.times { acc = blk.call(acc) }
  p acc
end

triple(1) do |n|
  n + 1
end


# やっぱりクラス内メソッドの呼び出しは、メソッド名のみで返り値を参照出来る。
class Hey
  def oyo
    1
  end

  def hey
    p 3 + oyo # ここ
  end
end

un = Hey.new
p un.hey


def search_unknown(nums, arg)
  newArray = []
  unNum = 42 # 42
  nums.each do |num| # 配列の各要素が入っている
    newNum = num + unNum # 2つ目の引数を加える前にunknown_numberを加えてる。
    result = newNum + arg # 2つ目の引数を加える
    if result % 5 == 0
      p result # ここのif文はちゃんと機能してる。45と50が入ってるから。
      newArray.push(num)
    end
  end
  p newArray # ここまで出来てる。
end

results = search_unknown([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], 0)
p results