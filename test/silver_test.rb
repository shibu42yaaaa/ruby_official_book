# 以下を修正して表示されるようにする

x = 0
def hoge
  (1..5).each do |i|
    x += 1
  end
  puts x
end

hoge

#修正
x = 0
def hoge
  (1..5).each do |x| #配列要素の1から5なので、以下２からの出力となる
    x += 1
    p x
  end
end

hoge

# 結果
# 1
# 2
# 3
# 4
# 5

# -------------------------------

begin
    puts 1 + "2"
rescue
    puts "Error"
rescue TypeError
    puts "Type Error"
ensure
    puts "Ensure."
end

# # # 結果
# Error
# Ensure.

# -------------------------------

# x = 10
# y = x < 10 ? "A" : "B"
# puts y

# 結果:B

# -------------------------------
def foo(*a)
  p a
end

foo(1,2,3)
# 結果
# [1, 2, 3]

# -------------------------------

class Hoge
  attr_reader :message
  def initialize
    @message = "Hello"
  end
end

class Piyo < Hoge
  def initialize
    @message = "Hi"  # Hogeクラスを上書き
    super            # 最終的にスーパークラスを呼び出している
  end
end

puts Piyo.new.message
# 結果:Hello

# -------------------------------

# # 園の面積を求める
include Math
def area r
  return r * r * Math::PI
end

p area 2

# -------------------------------

# ちょっとむずい
s = "Hello"

def s.greet
  puts "Hi!"
end

class String
  def greet
    puts "Hello!"
  end
end

s.greet

# 解説:
# クラス拡張して定義したメソッドより、特異メソッドが優先される
# Stringクラスを拡張してできたgreetよりも、特異メソッドのgreetを優先する


# -------------------------------

class Employee
  attr_reader :id
  attr_accessor :name
  def initialize id, name
    @id = id
    @naem = name
  end
  def to_s
    return "#{@id}:#{@name}"
  end

   以下の関数を埋める　ソートするための定義
  def <=> other
    return self.id <=> other.id
  end
end

employees = []
employees << Employee.new("3", "Tanaka")
employees << Employee.new("1", "Suzuki")
employees << Employee.new("2", "Sato")
employees.sort!
employees.each do |employee|
  puts employee
end

# -------------------------------

s1 = "Hoge"
s2 = "Fuga"
s1.concat(s2) # 文字列を結合する
s1.chop  #文字列の末尾を取り除く
s1.chomp  # 末尾の改行コードを削除する
s1+s2
puts s1

# 解説:
# concatメソッドは破壊的メソッドであり、
# それ以外は非破壊的メソッド。
# なので、concatメソッドがで更新される

# ------------------------------

#section2

x = 0
[1,2,3].each do |x|
  print x.to_s + " "
end

puts x
# # 結果: 1 2 3 0
# #中のブロックと外とは別
# -------------------------------

y = false
y && (raise "failed")
puts ("succeeded")

# # 解説:
# # &&は左辺の評価がfalseの場合は右辺を評価せず、
# # 次のステップへいく


# -------------------------------
# 1から10までの数を出力
(1..10).each do |i|
  puts i
end
# -------------------------------

# gsubメソッド "hoge"を"piyo"に変換する。（全ての文字列を置換する）
HOGE = "hoge"
HOGE.gsub!("hoge", "piyo")
p HOGE

# 類問
a = 'shimada-shimada'
p a.gsub!(/shi/, 'ya')
# -------------------------------

# 例外
begin
  puts 10 / 0 # ZeroDivisionError
rescue ZeroDivisionError => ex  # rescueで処理をかく
  p "ZeroDivisionException:", ex.message
end

# -------------------------------
class Parent
  attr_reader :name
  def initialize name
    @name = name
  end
end

class Child < Parent
  def initialize name
    @name = "Child" + name
  end
end

p Child.new("Hoge").name
# # 結果:"ChildHoge"

# -------------------------------

class Integer
  def to_square
    return self * self
  end
end

p 4.to_square
# # 結果:16

# -------------------------------
a = 1,2,3
p a.join(",") # 文字列を返す

# >> "1,2,3"

# -------------------------------
s = "a;b:c;d:e;f"
p s.split(/;|:/)

# >> ["a", "b", "c", "d", "e", "f"]

# -------------------------------
a = [1,2,3]
b = [1,3,5]
c = a
a = b & c
p a + b + c

# >> [1, 2, 3, 1, 2, 3, 1, 2, 3]

# -------------------------------

a = [1,2,3,4]
b = [1,3,5,7]
p a || b  # 左辺がtrueの場合、左辺のみを評価する

# >> [1, 2, 3, 4]

# -------------------------------

def sum(*a)
  total = 0
  a.each { |i| total += i}
  return total
end
p sum(1,2,3,4,5)
# >> 15
# -------------------------------

a = ["apple", "orange", "grape", "pine"]
a.each_with_index { |item, i| print i,":", item, "\n" }

# >> 
# 0:apple
# 1:orange
# 2:grape
# 3:pine
# -------------------------------

# 難しい
a = [:a,:a,:b,:c]
a[5] = :e
a.concat([:a,:b,:c]) # 破壊的メソッド
a.compact # 非破壊的メソッド（変更なし）
a.uniq    # 非破壊的メソッド（変更なし）
p a
# >> [:a, :a, :b, :c, nil, :e, :a, :b, :c]

# -------------------------------
a = [1,2,3,4,5,6]
p a.collect { |v| v * 2}

p a.map { |i| i * 2}
# >> [2, 4, 6, 8, 10, 12]

# -------------------------------

sarray = %w(Apple Orange Grape)
sarray.each { |v| print v, " "}

# # 別解
sarray.each do |i|
    print i, " "
end

# >> Apple Orange Grape
# -------------------------------

a = ["a","b","c"]
b = [1,2,3]

a.zip(b).each { |x| p x}
p "===================="
a.zip(b){ |x| p x}
p "===================="
[a, b].transpose.each{|x, y| p [x,y]}  # transpose:二次元配列の行と列を入れ替える

# >>
# ["a", 1]
# ["b", 2]
# ["c", 3]
# -------------------------------

a = "Ruby"
b = "Rails"
b = a
p b.upcase #>> "RUBY 非破壊的メソッドは一時的にしか使えない
print b # >> Ruby
p b     # >> "Ruby"

# -------------------------------

p "find!find!find!find!find!".index("!", 5)
# >> 9
#解説
# 列番５から始めて、!が見つかるのは列番9の時

# -------------------------------

x = "Hello, World.\n"
x.chop # 末尾1文字削除
x.chop
x.chomp # 末尾が行区切りであれば削除 （
p x #(＊破壊的メソッドなので変更なし）

# -------------------------------
# # 同じ結果になるもの
a = "abcdefghijk"
a[1,3] = "x"
print a, "\n"

x = "abcdefghijk"
x[1..3] = "x"
print x, "\n"

# -------------------------------

h = {1 => "Hoge", 2 => "Piyo", 3 => "fuga"}
p h.invert
# >> {"Hoge"=>1, "Piyo"=>2, "fuga"=>3}
# invert:キーと値を入れ替える
# -------------------------------

h = {1 => "Hoge", 2 => "Piyo", 3 => "fuga"}
p h.reject {|x, y| x < 2}  # >> {2=>"Piyo", 3=>"fuga"}
p h # >> {1=>"Hoge", 2=>"Piyo", 3=>"fuga"}

# -------------------------------
a = {"Foo" => "Hoge", "Bar" => "Piyo", "Buz" => "fuga"}
b = {"Foo" => "hoge", "Bar" => "piyo", "Buz" => "fuga"}

p a.update(b).sort{|a,b| a[1] <=> b[1]}
# >> [["Buz", "fuga"], ["Foo", "hoge"], ["Bar", "piyo"]]
