

{-
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs
                                then [x]
                                else x : elementosEnPosicionesPares (tail xs)

                                -}

-- Usando foldr
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares lista = foldr (\(x, y) acc -> if even y
                                                    then x : acc
                                                    else acc) [] (posicionElem lista [1,2..])

posicionElem :: [a] -> [Int] -> [(a, Int)]
posicionElem = zip

{-
entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys
                        then x : entrelazar xs []
                        else x : head ys : entrelazar xs (tail ys)
-}

-- Une ambas. Pone primero x, luego y. Si alguno esta vacío, lo completa

entrelazar :: [a] -> [a] -> [a]
entrelazar xs ys = undefined

