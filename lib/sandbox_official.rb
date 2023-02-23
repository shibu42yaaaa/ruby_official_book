def func a, b
  a + yield(b, 3)
end

p func(1,2){|x,y| x+y}