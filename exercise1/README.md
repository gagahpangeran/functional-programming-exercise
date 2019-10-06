# Exercise 1

## Exercises from chapter 9-10 of The Craft of Functional Programming

- Define the `length` function using `map` and `sum`.

  _Answer:_

  ```haskell
  lenMapSum arr = sum (map toOne arr)
                  where toOne _ = 1
  ```

- What does `map (+1) (map (+1) xs)` do? Can you conclude anything in general
  about properties of `map f (map g xs)`, where `f` and `g` are arbitary
  functions?

  _Answer:_

  `map (+1) (map (+1) xs)` do `(+2)` in every element in array.
  `map f (map g xs)` do `map (f . g) xs` where `(f . g)` is function composition
  `(f ∘ g)`.
