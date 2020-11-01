class SymbolManipulator
  def self.hash_key_switcher(arg)
    if arg.class != Hash
      arg
    else
      arg.transform_keys do |key|
        p "引数で貰うハッシュのkey", key
        if key.class == String
          key.to_sym
        elsif key.class == Symbol
          key.to_s
        else
          key.to_sym
        end
      end
    end
  end
end

symbol = SymbolManipulator.hash_key_switcher({ "hoge" => "foo", "piyo" => :boom })
p "23", symbol