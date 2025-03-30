{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)


--dados un elemento y una lista devuelve el resultado de eliminar de la lista la primera aparición del elemento
sacarUna :: Eq a => a -> [a] -> [a]
sacarUna elementoASacar lista= recr (\elemento lista contador -> lista ++ contador) [] lista

--Explicar por qué el esquema de recursión estructural (foldr) no es adecuado para implementar la función
-- sacarUna del punto anterior.

-- Porque nunca tengo ninguna garantía de saber cual es el último, al tener a lo sumo la ultima información y no la primera

insertar :: Ord a => a -> [a] -> [a]
insertar aMeter lista
  | null (insertarOrdenado aMeter lista) = [aMeter]
  | head (insertarOrdenado aMeter lista) > aMeter = aMeter : insertarOrdenado aMeter lista
  | otherwise = insertarOrdenado aMeter lista


insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado aMeter lista = recr (\elm lista cont -> if aMeter >= elm && notElem aMeter cont
                                                        then elm : aMeter : cont
                                                        else elm : cont) [] lista

