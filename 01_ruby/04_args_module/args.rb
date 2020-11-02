# 次の条件を満たすクラス、Argsを作成してください
# 特に指定のない限り、作成するメソッドはすべてpublicです
#
# 1.
#   3つの引数を取るメソッド `calc` を作成してください
#   1つ目の引数の文字列を、2つ目の引数の数だけ並べ、その文字列を3つ目の引数の数に等しい長さの配列の要素として新しい配列を作成し返してください
#   ただし、3つ目の引数はオプショナルとし、省略した場合は2つ目の引数と同じ数字を利用します
#   例： calc("hoge", 2, 3) # => ["hogehoge", "hogehoge", "hogehoge"]
#
# 2.
#   2つのキーワード引数arrayとkeywordを取るメソッド、 `count_object` を作成してください。
#   arrayの各要素の中に、keywordが何回現れるかを返してください
#   ただし、arrayはデフォルトで空の配列が与えられるものとします
#
# 3.
#   2つのキーワード引数benriとsugoiを取るメソッド、 `configure` を作成してください
#   また、2つのキーワード引数の他に、オプショナルでキーワード引数を取得できるようにしてください
#   オプショナルなキーワード引数のうち、 `c_` で始まるキーワードが渡された場合には、benriとsugoiと同様の挙動をしてください。ただし、キーワードを扱うときに `c_` の文字列は取り除いてください。
#   `c_` で始まるオプショナルなキーワードを扱うときは、文字列でソートした順に扱ってください。
#   benriとyabaiの内容を、 "Configure 'keyword' as 'value'" の文字列で出力してください。keywordはキーワード、valueはキーワードに渡された値でそれぞれ埋めてください。
#   `c_` で始まるキーワードに関しては、この二つの後に出力してください
#
#   例： configure(benri: "yabai", sugoi: "oniyabai", c_hoge: "uhyo-", c_foo: "iihanashi")
#        # =>
#         Configure 'benri' as 'yabai'
#         Configure 'sugoi' as 'oniyabai'
#         Configure 'foo' as 'iihanashi'
#         Configure 'hoge' as 'uhyo-'


class Args
  def calc(arg1, arg2, arg3 = arg2)
    if arg1.class != String
      stringArg1 = arg1.to_s
      newString = stringArg1*arg2
    else
      newString = arg1*arg2
    end
    Array.new(arg3, newString) # new(size, val)
  end

  def count_object(array: [], keyword:)
    count = 0
    if array.empty? == false
      array.each do |n|
        if n == keyword
          count += 1
        end
      end
      # count # この子が大事
    else
      # count
    end
    count
  end

  def configure(benri: benri_value, sugoi: sugoi_value, **options)
    result = ""
    optionsHash = []
    if options.empty? == false
      result << "Configure 'benri' as '#{benri}'\n" + "Configure 'sugoi' as '#{sugoi}'\n"
      options.each do |key, value| # { :c_key => value }
        stringKey = key.to_s
        if stringKey.include?("c_") == true
          deleteC_Key = stringKey.delete('c_')
          optionsHash.push([deleteC_Key, value])
        end
      end
      sortOptionsHash = optionsHash.sort
      sortOptionsHash.each do |option|
        result << "Configure '#{option[0]}' as '#{option[1]}'\n"
      end
    else
      result << "Configure 'benri' as '#{benri}'\n" + "Configure 'sugoi' as '#{sugoi}'\n"
    end
  end
end