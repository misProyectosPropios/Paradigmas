
-- Devuelve la lista ordenada
mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [a] = [a]
mergesort lista = merge (mergesort (agarrarMitadAdelante lista)) (mergesort (agarrarMitadDetras lista))

agarrarMitadAdelante :: [a] -> [a]
agarrarMitadAdelante lista = take (div (length lista) 2) lista

agarrarMitadDetras :: [a] -> [a]
agarrarMitadDetras lista = drop (div (length lista) 2) lista


merge :: Ord a => [a] -> [a] -> [a]
merge [] y = y
merge x [] = x
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys