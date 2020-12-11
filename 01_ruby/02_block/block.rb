# 次の要件を満たすクラス、LearnBlockを作成してください　
#
# 1.
# 次の仕様を満たすメソッド `ext_sum` を作成してください
# 引数を2つと、その2つを `+` で結合した後の値を引数に取るブロックの3つを引数に取ります
# ただし、ブロックを渡さなくても動作します
# ブロックを受け取った場合、メソッドの戻り値はブロックの戻り値と等しい
# ブロックを受け取らなかった場合、メソッドの戻り値はブロックに渡す予定だった値と等しい
#
# 2.
# 次の仕様を満たすメソッド `search_unknown` を作成してください
# 引数を2つ受け取ります、1つ目の引数は必ず数値の配列です
# 1つ目の引数の中から、2つ目の引数を加えるとちょうど5の倍数になる数値だけを取り出して、新しい配列を作成し戻り値としてください
# ただし、LearnBlockクラスには、この仕様とは全く関係ないメソッド `unknown_number` メソッドが定義されていると仮定します(このメソッドは実装する必要はありません）
# 2つ目の引数を加える前に、必ずこの `unknown_number` の戻り値を、1つ目の引数の各数値に加えてから計算してください
# また、 `unknown_number` メソッドは、一度しか呼び出すことはできません
class LearnBlock
  def ext_sum(arg1, arg2, &blk)
    join = arg1 + arg2
    if block_given?
      result = blk.call(join)
    else
      join
    end
  end

  def search_unknown(nums, arg)
    newArray = []
    unNum = unknown_number # 42
    nums.each do |num| # 配列の各要素が入っている
      newNum = num + unNum # 2つ目の引数を加える前にunknown_numberを加えてる。
      result = newNum + arg # 2つ目の引数を加える
      if result % 5 == 0
        newArray << num
      end
    end
    # ここでpメソッドで確認したら出来てる。だがsearch_unkcownには上手く返ってない
    newArray # これ書いたらちゃんとテスト通ったな。でもなんで通ったかわからない。最後に評価された式がこの子になったから？
  end
end
