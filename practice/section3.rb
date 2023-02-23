# 配列

# v1 = %w(hoge foo bar)

# p v1.join()     # "hogefoobar"
# p v1.join("_")  # "hoge_foo_bar"

# # ---
# p a = Array.new(5)
# p a.length
# # 配列の要素が２。0番目を10とする
# p Array.new(2){ |index| index + 10 }

# [nil, nil, nil, nil, nil]
# 5
# [10, 11]

# -----
# # 配列の要素は２つ。aとする 
# a = Array.new(2, "a")
# # 要素0をbに置き換える
# p a[0].replace("b")
# p a

# ----
# # ブロックで初期化すると上記のようにはならない
# # 0番目だけを置き換える
# a = Array.new(2){"a"}
# a[0].replace("b")
# p a # ["b", "a"]

# ---------
# v1 = [10,nil,nil,"aa"]
# p v1[0]
# p v1[1]
# p v1[2]
# p v1[3]
# p v1[4] # 要素がないためnilとなる
# # 4つ目基準を−1
# p v1[4-1]

# #--
# def func y
#   y + yield
# end

# x = 2

# p func(1){x += 2}
# p x

# --

# def func a, b
#   a + yield(b, 3)
# end

# p func(1,2){|x,y| x+y}

#--

# proc = Proc.new{|x| p x}
# proc.call(1)

#--

# def func x
#   x + yield
# end

# proc = Proc.new{2}
# p func(1, &proc)

#--
# each_with_index
# [3,4,5].each_with_index do |value, index|
#   p value + index
# end

#-- ハッシュのeach
# {:a => 1, :b => 2}.each do |key, value|
#   p "#{key}:#{value}"
# end

#--

# スレッド

# t = Thread.new do
#   p = 'start'
#   sleep 5
#   p "end"
# end

# p "wait"

# t.join

#--
# 3.times do |i|
#   Thread.start(i) do |index|
#     p "thread-#{index} start"
#   end
# end

# sleep 1
# p "end"

#-- 例外

# begin
#   1 / 0 # エラーが発生
# rescue
#   p "erro" # こっちを実行
# end

# --

# begin
#   a = 1 / 0
# rescue ZeroDivisionError => e
#   p e.backtrace
# end

#--

def bar
  catch(:calc) do
    throw :calc, 100
  end
end

p bar































