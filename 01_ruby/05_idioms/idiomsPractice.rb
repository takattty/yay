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
      begin
        raise DoubleError # 意図的に例外を発生させる
      rescue DoubleError # 例外が発生した場合の処理
        DoubleError
      end
    end
  end
end

result1 = Idioms.double("hoge")
p "test_string_double", result1
result2 = Idioms.double(11)
p "test_integer_double", result2
result3 = Idioms.double("test")
p "test_raise", result3