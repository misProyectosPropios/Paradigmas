{-

prefijos :: [a] -> [[a]]
prefijos [] = [[]]
prefijos x = take (length x) x : prefijos (take (length x - 1) x)
-}

--prefijos :: [a] -> [[a]]
--prefijos = foldr (\x acc -> (x : head acc) ++ acc) []
--
--sublistas :: [Int] -> [[Int]]
--sublistas lista = [] : map (\(inicio, fin) -> drop inicio (take fin lista)) (paresMenorAMayor (length lista))
--
--paresMenorAMayor :: Int -> [(Int, Int)]
--paresMenorAMayor valor = [(x, y) | x <- [0..valor], y <- [0..valor], x < y]

{-
subsets :: [a] -> [[a]]
subsets [] = [[]]
subsets (x:xs) = addEveryListElem x (subsets xs) ++ subsets xs
-}
--addEveryListElem :: a -> [[a]] -> [[a]]
--addEveryListElem _ [] = [[]]
--addEveryListElem valor [a] = [valor : a]
-- addEveryListElem valor (x:xs) = (valor : x) : addEveryListElem valor xs

addEveryListElem :: a -> [[a]] -> [[a]]
addEveryListElem valor= map (valor :)

partes :: [a] -> [[a]]
partes = foldr (\x acc -> addEveryListElem x acc ++ acc) [[]]




-- Todo este código es para lograr permutaciones
 {- 
permutaciones :: [Int] -> [[Int]]
permutaciones [] = []
permutaciones [x] = [[x]]
permutaciones (x:xs) = agregarPermutacionesACadaElem x (permutaciones xs)

agregarPermutacionesACadaElem :: Int -> [[Int]] -> [[Int]]
agregarPermutacionesACadaElem valor [] = [[valor]]
agregarPermutacionesACadaElem valor [a] = agregarDesdeInicioAFinElem valor a
agregarPermutacionesACadaElem valor xs = agregarDesdeInicioAFinElem valor (head xs) ++ agregarPermutacionesACadaElem  valor (tail xs) 

agregarDesdeInicioAFinElem :: Int -> [Int] -> [[Int]]
agregarDesdeInicioAFinElem valor lista = agregarDesdeInicioAFinElemPosicion valor lista (length lista) 

agregarDesdeInicioAFinElemPosicion :: Int -> [Int] -> Int -> [[Int]]
agregarDesdeInicioAFinElemPosicion valor lista 0 = [agregarEnPosicionNValor 0 lista valor]
agregarDesdeInicioAFinElemPosicion valor lista x = agregarEnPosicionNValor x lista valor : agregarDesdeInicioAFinElemPosicion valor lista (x - 1)

agregarEnPosicionNValor :: Int -> [Int] -> Int -> [Int]
agregarEnPosicionNValor posicion lista valor = (take posicion lista ++ [valor]) ++ drop posicion lista
-}
-- permutaciones :: [Int] -> [[Int]]
--permutaciones