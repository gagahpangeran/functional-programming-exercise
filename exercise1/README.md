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
