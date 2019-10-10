-- Number 1
lenMapSum arr = sum (map toOne arr) where toOne _ = 1

-- Alt solution
lenMapSumAlt :: Num a => t -> [x] -> a
lenMapSumAlt arr = sum . map(\_ -> 1)

-- Number 2
mapMapPlus xs = map (+1) (map (+1) xs)

-- HoF for number 2
mapMap1 f g xs = map f (map g xs)
mapMap2 f g xs = map (f . g) xs
mapMap3 f g = map (f . g)

-- Number 3
iter :: (Num x, Eq x) => x -> (a -> a) -> a -> a
iter 0 f x = x
iter n f x = f (iter (n-1) f x)

-- Number 4
iterSucc n = \n -> iter n succ

-- Number 5
squareSum n = foldr (+) 0 square where square = map (^2) [1..n]

-- Alt Solution
squareSumAlt n = foldr (+) 0 (map (^2) [1..n])

-- Number 6
mystery xs = foldr (++) [] (map sing xs)
  where
    sing x = [x]

-- Alt function
mysteryAlt xs = foldr (++) [] (map (\x -> [x]) xs)