{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use sum" #-}

limpiar :: String -> String -> String
limpiar [] frase            = frase
limpiar (caracterABorrar : listaDeCaracteresABorrar) fraseABorrar =
    limpiar (sacarLetra caracterABorrar listaDeCaracteresABorrar) (sacarLetra caracterABorrar fraseABorrar)

difPromedio :: [Float] -> [Float]
difPromedio [] = []
difPromedio xs = sumarKConstante (promedio xs) xs

promedio :: [Float] -> Float
promedio lista = sumarValores lista / lengthLista lista


lengthLista :: [a] -> Float
lengthLista = foldr (\ x -> (+) 1) 0

sumarValores :: Num a => [a] -> a
sumarValores = foldr (+) 0



sumarKConstante :: Num a => a -> [a] -> [a]
sumarKConstante k = map (+ (-k))

esLaMismaLetra :: Char -> Char -> Bool
esLaMismaLetra x y = x == y

sacarLetra :: Char -> String -> String
sacarLetra letra = filter (not . esLaMismaLetra letra)

todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [a] = True
todosIguales (x1 : x2 : xs) | x1 == x2 = todosIguales (x2 : xs)
                            | otherwise = False
