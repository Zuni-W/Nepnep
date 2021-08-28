module Test where

ea :: [a] -> Int -> a
ea (a:_) 1 = a
ea (_:s) k = ea s (k-1)
ea x n = last $ take n x

powmod :: (Integral a)=>a->a->a->a
powmod a e n = a ^ e `mod` n

powmod1 :: (Integral a)=>a->a->a->a
powmod1 a 1 n = a `mod` n
powmod1 a e n = a * (powmod1 a (e-1) n ) `mod` n

quicksort :: (Ord a)=>[a]->[a]
quicksort [] = []
quicksort (x:xs) =
  let sS =quicksort [a|a<-xs,a<=x]
      bS =quicksort [a|a<-xs,a>x]
  in sS++[x]++bS

t ::(Num a)=> a->a->a->a->a->a->a
t a b c d e f=a+b+c+d+e+f
