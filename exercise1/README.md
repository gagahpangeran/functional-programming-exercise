# Exercise 1

## Exercises from chapter 9-10 of The Craft of Functional Programming

- Define the `length` function using `map` and `sum`.

  _Answer:_

  ```haskell
  lenMapSum arr = sum (map toOne arr) where toOne _ = 1
  ```

  ```haskell
  lenMapSumAlt arr = sum . map (\_ -> 1)
  ```

- What does `map (+1) (map (+1) xs)` do? Can you conclude anything in general
  about properties of `map f (map g xs)`, where `f` and `g` are arbitary
  functions?

  _Answer:_

  `map (+1) (map (+1) xs)` do `(+2)` in every element in array.
  `map f (map g xs)` do `map (f . g) xs` where `(f . g)` is function composition
  `(f ∘ g)`.

- Give the type of, and define the function `iter` so that

  ```haskell
  iter n f x = f (f (... (f x)))
  ```

  where `f` occurs `n` times on the right-hand side of the equation. For
  instance, we should have

  ```haskell
  iter 3 f x = f (f (f x))
  ```

  and `iter 0 f x` should return `x`.

  _Answer:_

  ```haskell
  iter :: (Num x, Eq x) => x -> (a -> a) -> a -> a
  iter 0 f x = x
  iter n f x = f (iter (n-1) f x)
  ```

- What is the type and effect of the following function?

  ```haskell
  \n -> iter n succ
  ```

  `succ` is the successor function, which increases a value by one:

  ```haskell
  Prelude> succ 33
  34
  ```

  _Answer:_

  ```haskell
  \n -> iter n succ :: (Enum a, Eq x, Num x) => x -> a -> a
  ```

  The effect is there are additional data type `Enum` in input and output
  because of `succ` function.

- How would you define the sum of the squares of the natural numbers 1 to `n`
  using `map` and `foldr`?

  _Answer:_

  ```haskell
  squareSum n = foldr (+) 0 square where square = map (^2) [1..n]
  ```

  ```haskell
  squareSumAlt n = foldr (+) 0 (map (^2) [1..n])
  ```

- How does the function

  ```haskell
  mystery xs = foldr (++) [] (map sing xs)
    where
      sing x = [x]
  ```

  behave?

  _Answer:_

  The function mapping each element in the list and change it to single element
  list. After that, the single element list will be concated again each other.
  The output is equivalent with the input list.

- If `id` is the polymorphic identity function, defined by `id x = x`, explain
  the behavior of the expressions

  - `(id . f)`
  - `(f . id)`
  - `(id f)`

  If `f` is of type `Int -> Bool`, at what instance of its most general type
  `a -> a` is `id` used in each case?

  _Answer:_

  ```haskell
  (id . f) = (id :: Bool -> Bool) (f x) =  f x
  ```

  ```haskell
  (f . id) = f ((id :: Int -> Int) x) = fx
  ```

  ```haskell
  (id f) = (id :: (Int -> Bool) -> (Int -> Bool)) f = f
  ```

- Define a function `composeList` which composes a list of functions into a
  single function. You should give the type of `composeList`, and explain why
  the function has this type. WHat is the effect of your function on an empty
  list of functions?

  _Answer:_

  ```haskell
  composeList :: [(a -> a)] -> a -> a
  composeList xs = foldr (.) id xs
  ```

  ```haskell
  composeListAlt :: [(a -> a)] -> a -> a
  composeListAlt = foldr (.) id
  ```

- Define the function

  ```haskell
  flip :: (a -> b -> c) -> (b -> a -> c)
  ```

  which reverses the order in which its function argument takes its arguments.\
  The following example shows the effect of `flip`:

  ```haskell
  Prelude> flip div 3 100
  33
  ```

  _Answer:_

  ```haskell
  flip f a b = f b a
  ```

## List Comprehensions and Higher-Order Functions

- Can you rewrite the following list comprehensions using higher-order functions
  `map` and `filter`? You might need the function concat too.

  1. `[ x+1 | x <- xs ]`

     ```haskell
     map (+1) xs
     ```

  2. `[ x+y | x <- xs, y <- ys ]`

     ```haskell
     concat (map (\x -> map (+x) ys) xs)
     ```

  3. `[ x+2 | x <- xs, x > 3 ]`

     ```haskell
     map (+2) (filter (>3) xs)
     ```

  4. `[ x+3 | (x,_) <- xys ]`

     ```haskell
     map ((+3) . fst) xs
     ```

  5. `[ x+4 | (x,y) <- xys, x+y < 5]`

     ```haskell
     map ((+4) . fst) (filter (\(x,y) -> x + y < 5) xys)
     ```

  6. `[ x+5 | Just x <- mxs ]`

     ```haskell
     map ((+5) . \(Just x) -> x) (filter isJust mxs)
      where isJust Nothing = False
            isJust (Just x) = True
     ```

- Can you it the other way around? I.e. rewrite the following expressions as list comprehensions.

  1. `map (+3) xs`

     ```haskell
     [x+3 | x <- xs]
     ```

  2. `filter (>7) xs`

     ```haskell
     [x | x <- xs , x > 7]
     ```

  3. `concat (map (\x -> map (\y -> (x,y)) ys) xs)`

     ```haskell
     [(x, y) | x <- xs, y <- ys]
     ```

  4. `filter (>3) (map (\(x,y) -> x+y) xys)`

     ```haskell
     [x+y | (x,y) <- xys, x+y > 3]
     ```
