module Pow where

pow :: Num  -> Num  -> Num 

pow a n = a * pow a (n-1)
pow a 1 = a

