# 次の仕様を満たすクラスIdiomsを作成してください
# 1.
#   引数を一つ取るクラスメソッド `double` を作成してください
#   戻り値は、引数に渡した文字列を二つ連結したものを返してください e.g. "text" => "texttext"
#   ただし、文字列 "test" を引数に渡したときに限って、次の例外を発生させてください
#   例外は、StandardErrorを継承したDoubleErrorを発生させてください。
#   例外クラスは、 `Idioms::` の下の名前空間で定義してください
class Idioms
  class DoubleError < StandardError; end
  def self.double(arg)
    if arg != "test"
      if arg.class == String
        arg*2
      elsif arg.class == Integer
        stringArg = arg.to_s
        stringArg*2
      end
    else # arg == "test"
      # begin
      #   raise (DoubleError) # 意図的に例外を発生させる
      # rescue DoubleError # 例外が発生した場合の処理
      # end
      raise DoubleError
    end
  end
end