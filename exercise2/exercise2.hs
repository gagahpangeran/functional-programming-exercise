-- Number 1
num1 = [x+y | x <- [1..4], y <- [2..4], x > y]

-- Number 2
divisor n = [x | x <- [1 .. n], n `mod` x == 0]

-- Number 3
quickSort [] = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x]
                   ++ [x] ++
                   quickSort [y | y <- xs, y > x]

-- Alt Solution
quickSortAlt [] = []
quickSortAlt (x:xs) = quickSortAlt (filter (<=x) xs)
                      ++ [x] ++
                      quickSortAlt (filter (>x) xs)

-- Number 4
perm [] = [[]]
perm ls = [ x:ps | x <- ls, ps <- perm(ls\\[x])]

-- Number 5
primes = sieve [2 ..]
    where sieve (x:xs) = x : (sieve [z | z <- xs, z `mod` x /= 0])

-- Number 6
pythaTriple = [(x,y,z) |  z <- [5 ..]
                        , y <- [z, z-1 .. 1]
                        , x <- [y, y-1 .. 1]
                        , x*x + y*y == z*z ]

-- Alt Solution
pythaTripleAlt = [(x,y,z) |  z <- [5 ..]
                           , y <- [z-1, z-2 .. 1]
                           , x <- [y-1, y-2 .. 1]
                           , x*x + y*y == z*z ]