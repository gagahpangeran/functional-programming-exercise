# Exercise 2

## Lazy Evaluation

1. Uraikan langkah evaluasi dari ekspresi berikut
   `[x+y | x <- [1..4], y <- [2..4], x > y]`

   _Answer:_

   x = [1, 2, 3, 4]\
   y = [2, 3, 4]

   [(x,y)] x > y\
   [(3,2), (4,2), (4,3)]

   [x+y]\
   [5, 6, 7]

2. Buatlah fungsi divisor yang menerima sebuah bilangan bulat ​`n`​ dan
   mengembalikan list bilangan bulat positif yang membagi habis `​n`​, Contoh:

   ```haskell
   LatihanLazy> divisor 12
   [1,2,3,4,6,12]
   ```

   _Answer:_

   ```haskell
   divisor n = [x | x <- [1 .. n], n `mod` x == 0]
   ```

3. Buatlah definisi ​quick sort​ menggunakan list comprehension

   _Answer_:

   ```haskell
   quickSort [] = []
   quickSort (x:xs) = quickSort [y | y <- xs, y <= x]
                      ++ [x] ++
                      quickSort [y | y <- xs, y > x]
   ```

   ```haskel
   quickSortAlt [] = []
   quickSortAlt (x:xs) = quickSortAlt (filter (<=x) xs)
                         ++ [x] ++
                         quickSortAlt (filter (>x) xs)
   ```

4. Buatlah definisi infinite list untuk permutation

   ```haskell
   perm [] = [[]]
   perm ls = [ x:ps | x <- ls, ps <- perm(ls\\[x])]
   ```

5. Buatlah definisi untuk memberikan infinite list dari bilangan prima
   menerapkan algoritma ​*Sieve of Erastothenes​*.

   _Answer:_

   ```haskell
   primes = sieve [2 ..]
     where sieve (x:xs) = x : (sieve [z | z <- xs, z `mod` x /= 0])
   ```

6. Buatlah definisi infinite list dari ​triple pythagoras​. List tersebut terdiri
   dari element triple bilangan bulat positif yang mengikut persamaan pythagoras
   `x^2 + y^2 = z^2`.\
   Contoh:

   ```haskell
   LatihanLazy > pythaTriple
   [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20) ...]
   ```

   Perhatian urutan penyusun list comprehension nya, coba mulai dari variable z!

   _Answer:_

   ```haskell
   pythaTriple = [(x,y,z) |  z <- [5 ..]
                          , y <- [z, z-1 .. 1]
                          , x <- [y, y-1 .. 1]
                          , x*x + y*y == z*z ]
   ```

   ```haskell
    pythaTripleAlt = [(x,y,z) |  z <- [5 ..]
                              , y <- [z-1, z-2 .. 1]
                              , x <- [y-1, y-2 .. 1]
                              , x*x + y*y == z*z ]
   ```
