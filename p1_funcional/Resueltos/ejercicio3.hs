{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use max" #-}
{-# HLINT ignore "Use const" #-}
import Data.Sequence.Internal.Sorting (QList(Nil))
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Use product" #-}

suma :: Num a => [a] -> a
suma = \x -> foldr (+) 0 x

factorial :: Int -> Int
factorial n = foldr (*) 1 [2..n]


elemSearch :: Int -> [Int] -> Bool
elemSearch value list = foldr (\x acc -> (x == value) || (x /= value && acc)) False list

concatenation :: [a] -> [a] -> [a]
concatenation lista1 lista2 = foldr (:) lista2 lista1

funcionDuplicar :: Int -> Int
funcionDuplicar x = 2 * x

mapList :: (a -> b) -> [a] -> [b]
mapList f lista = foldr (\x acc -> f x : acc) [] lista

filterList :: (a -> Bool) -> [a] -> [a]
filterList f lista = foldr (\x acc -> if f x then x : acc else acc) [] lista

-- Neecsito una función lambda que tome: el valor de x y que luego lo agregue a otro

{- 
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun fComparacion [a] = a
mejorSegun fComparacion (x1 : x2 : xs) | fComparacion x1 x2 = mejorSegun fComparacion (x1 : xs)
                                       | otherwise = mejorSegun fComparacion (x2 : xs)

-}

{- 

mejorSegun :: (Int -> Int -> Bool) -> [Int] -> Int
mejorSegun fComparacion (x1:xs) = foldr (\x acc-> if fComparacion x acc then x else acc) x1 xs

-}

mejorSegun :: (Int -> Int -> Bool) -> [Int] -> Int
mejorSegun fComparacion xs = foldr1 (\x acc-> if fComparacion x acc then x else acc) xs


sumaParcialesEmpezado :: Num a => [a] -> [a]
sumaParcialesEmpezado [] = []
sumaParcialesEmpezado [a] = []
sumaParcialesEmpezado (x1 : x2 : xs) = (x1 + x2) : sumaParcialesEmpezado (x1 + x2 : xs)


sumaParciales :: Num a => [a] -> [a]
sumaParciales [a] = [a]
sumaParciales (x : xs) = x : sumaParcialesEmpezado (x : xs)


sumaAlt :: Num a => [a] -> a
sumaAlt lista = foldr (\x acc -> x - acc) 0 lista

sumaAltLeft :: Num a => [a] -> a
sumaAltLeft lista = foldl (\x acc -> acc - x) 0 lista




-- Debería hacer 

{-
    Tengo que iterar a traves de todas las primeras posibilidades
    La agrego a la lista
    Y ahora le a

-}

{-
    Ejemplo 1 2 3
    1 2 3
    1 3 2
    2 1 3
    2 3 1
    3 1 2
    3 2 1
    3!
-}
