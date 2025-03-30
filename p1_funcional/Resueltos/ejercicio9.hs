 
{-
i. Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de
Haskell (la función va a estar definida sólo para los enteros mayores o iguales
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Avoid lambda" #-}

foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat f base 0 = base
foldNat f base n = f n (foldNat f base (n - 1))

{-
ii. Utilizando foldNat, defnir la función
-}

-- No es lo que pedía 
factorial :: Integer -> Integer
factorial valor = foldNat (\x acc -> acc * x) 1 valor

{-
potencia :: Integer -> Integer -> Integer
potencia _ 0 = 1
potencia x n = x * potencia x (n - 1)
-}

-- COn foldNat

potencia :: Integer -> Integer -> Integer
potencia base = foldNat (\x acc -> acc * base) 1