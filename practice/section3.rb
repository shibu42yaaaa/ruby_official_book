# 配列

v1 = %w(hoge foo bar)

p v1.join()     # "hogefoobar"
p v1.join("_")  # "hoge_foo_bar"

# ---
p a = Array.new(5)
p a.length
# 配列の要素が２。0番目を10とする
p Array.new(2){ |index| index + 10 }

# [nil, nil, nil, nil, nil]
# 5
# [10, 11]

# -----
# 配列の要素は２つ。aとする 
a = Array.new(2, "a")
# 要素0をbに置き換える
p a[0].replace("b")
p a

# ----
# ブロックで初期化すると上記のようにはならない
# 0番目だけを置き換える
a = Array.new(2){"a"}
a[0].replace("b")
p a # ["b", "a"]

# ---------
v1 = [10,nil,nil,"aa"]
p v1[0]
p v1[1]
p v1[2]
p v1[3]
p v1[4] # 要素がないためnilとなる
# 4つ目基準を−1
p v1[4-1]
