# Exercise 1 : High Order Function

## Exercises from chapter 9-10 ofThe Craft of Functional Programming

- Define the `length` function using `map` and `sum`.
  ```haskell
  lenMapSum arr = sum (map toOne arr)
                  where toOne _ = 1
  ```
- What does `map (+1) (map (+1) xs)` do? Can you conclude anything in general
  about properties of `map f (map g xs)`, where `f` and `g` are arbitary
  functions?
