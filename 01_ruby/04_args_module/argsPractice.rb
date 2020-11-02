# def count_object(array: [], keyword:)
#   count = 0
#   if array.empty? == false
#     array.each do |n|
#       if n == keyword
#         count += 1
#         p "count", count
#       end
#     end
#     count
#   else
#     count
#   end
# end

# result = count_object(array: [1,3,4,2,3,6,7,8,10], keyword: 3)
# p "result", result


# def configure(required1 = required1_default, required2 = required2_default, options = {})
#   p required1, required2, options
#   configure_required1(required1)
#   configure_required2(required2)
#   configure_option1(options[:option1]) if options[:option1]
#   configure_option2(options[:option2]) if options[:option2]
#   configure_option3(options[:option3]) if options[:option3]
#   configure_option4(options[:option4]) if options[:option4]
#   configure_option5(options[:option5]) if options[:option5]
#   # and more...
# end

# result = configure("hoge","foo", option3: "piyo")
# p "result", result


# def configure(required1: required1_default, required2: required2_default, **options)
#   p required1, required2, options
#   # configure_required1(required1)
#   # configure_required2(required2)
#   # configure_option1(options[:option1]) if options[:option1]
#   # configure_option2(options[:option2]) if options[:option2]
#   # configure_option3(options[:option3]) if options[:option3]
#   # configure_option4(options[:option4]) if options[:option4]
#   # configure_option5(options[:option5]) if options[:option5]
#   # and more...
# end

# result = configure(required1: 1,  required2: 4, option2: 4) # valid
# # resu = configure(option3: "foo") # valid
# # configure({ option5: "piyo" }) # warning appear on Ruby2.7
# p result # => [1, 4, {:option2=>4}]
# # p resu # Error


def configure(benri: benri_value, sugoi: sugoi_value, **options)
  result = ""
  if options.empty? == false
    result.concat "Configure 'benri' as '#{benri}'\n", "Configure 'sugoi' as '#{sugoi}'\n"
    optionsHash = []
    options.each do |key, value| # { :c_key => value }
      stringKey = key.to_s
      if stringKey.include?("c_") == true
        deleteC_Key = stringKey.delete('c_')
        optionsHash.push([deleteC_Key, value])
      end
    end
    sortOptionsHash = optionsHash.sort
    sortOptionsHash.each do |option|
        result.concat("Configure '#{option[0]}' as '#{option[1]}'\n")
    end
  else
    result.concat(
      "Configure 'benri' as '#{benri}'\n" +
      "Configure 'sugoi' as '#{sugoi}'\n"
    )
  end
  result
end

result1 = configure(sugoi: 1, benri: 2)
puts "result1", result1

result2 = configure(sugoi: 1, benri: 2, c_yabai: 3)
puts "result2", result2

result3 = configure(sugoi: 1, benri: 2, c_yabai: 3, c_majide: 4)
puts "result3", result3

result4 = configure(sugoi: 1, benri: 2, c_yabai: 3, majide: 4)
puts "result4", result4