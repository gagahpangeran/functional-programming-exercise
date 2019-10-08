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
  iter n f x = iter (n-1) (f.f)
  ```
