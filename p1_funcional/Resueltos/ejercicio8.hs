 

{-

De forma recursiva

sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat [] [] = [[]]
sumaMat [xs] [ys] = [sumaVector xs ys]
sumaMat (x:xs) (y:ys) = sumaVector x y : sumaMat xs ys

sumaVector :: [Int] -> [Int] -> [Int]
sumaVector [] [] = []
sumaVector (x:xs) (y:ys) = x + y : sumaVector xs ys
-}

--sumaVector :: [Int] -> [Int] -> [Int]
--sumaMat xs ys = foldr (\x acc ys -> x + head ys : acc ) []
--
--sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
--sumaMat xs ys = foldr (\x acc -> x (head ys): acc) [[]] xs