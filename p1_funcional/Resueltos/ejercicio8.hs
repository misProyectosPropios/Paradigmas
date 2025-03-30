

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

-- Si a cada iteración le paso una tupla (aDevolver, ys) podría hacerlo?


-- Voy a asumir que xs e ys tienen la misma longitud
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use bimap" #-}
-- sumaVector :: [Int] -> [Int] -> [Int]
-- sumaVector xs ys = snd $ foldr (\x (listaYs, res) -> (init listaYs, last listaYs + x : res)) ( ys, []) xs

--sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
--sumaMat xs ys = snd $ foldr (\x (listaYs, res) -> (init listaYs, sumaVector x (head listaYs) : res)) (ys, []) xs


-- Complejidad menor, ya que init es O(n), pero si hago un reverse en ys va a funcioanr solo una vez O(n)
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat xs ys = snd $ foldr (\x (listaYs, res) -> (tail  listaYs, sumaVector x (head listaYs) : res)) (reverse ys, []) xs

sumaVector :: [Int] -> [Int] -> [Int]
sumaVector xs ys = snd $ foldr (\x (listaYs, res) -> (tail listaYs, head listaYs + x : res)) (reverse ys, []) xs