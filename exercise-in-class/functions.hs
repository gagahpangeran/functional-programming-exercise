add [] []         = []
add (a:as) (b:bs) = (a+b) : (add as bs)

fibs  =  1:1:add fibs (tail fibs)

fib = 1:1:zipWith (+) fib (tail fib)

flipp :: (a->b->c) -> (b->a->c)
flipp f a b = f b a

fun = \a -> \b -> \c -> a*(b-c)

flipFun = flipp fun

