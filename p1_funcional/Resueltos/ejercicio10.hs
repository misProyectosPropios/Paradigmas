 
{-

Definir la función genLista :: a -> (a -> a) -> Integer -> [a], que genera una lista de una cantidad
dada de elementos, a partir de un elemento inicial y de una función de incremento entre los elementos
de la lista. Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente

-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Eta reduce" #-}

foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat f base 0 = base
foldNat f base n = f n (foldNat f base (n - 1))



sumaConFoldl :: Num a => [a] -> a
sumaConFoldl = foldl (+) 0

genLista :: a -> (a -> a) -> Integer -> [a]
genLista inicio f cant = reverse $ foldNat (\x res -> f (head res) : res) [inicio] cant

{-

Usando genLista, definir la función desdeHasta, que dado un par de números (el primero menor que el
segundo), devuelve una lista de números consecutivos desde el primero hasta el segundo.

-}

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta inicio fin = genLista inicio (+1) (fin - inicio)