-- Number 1
num1 = [x+y | x <- [1..4], y <- [2..4], x > y]

-- Number 2
divisor n = [x | x <- [1 .. n], n `mod` x == 0]

-- Number 3
quickSort [] = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x]
                   ++ [x] ++
                   quickSort [y | y <- xs, y > x]