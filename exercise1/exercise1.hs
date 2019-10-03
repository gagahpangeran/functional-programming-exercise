-- Number 1
lenMapSum arr = sum (map toOne arr) where toOne _ = 1

-- Number 2
mapMapPlus xs = map (+1) (map (+1) xs)
