
{-
Considerar el siguiente tipo, que representa a los árboles binarios:
data AB a = Nil | Bin (AB a) a (AB a)
i. Usando recursión explícita, definir los esquemas de recursión estructural (foldAB) y primitiva (recAB), y
dar sus tipos.
ii. Definir las funciones esNil, altura y cantNodos (para esNil puede utilizarse case en lugar de foldAB
o recAB).

Definir la función mejorSegún :: (a -> a -> Bool) -> AB a -> a, análoga a la del ejercicio 3, para árboles.
Se recomienda definir una función auxiliar para comparar la raíz con un posible resultado de la recursión
para un árbol que puede o no ser Nil.
iv. Definir la función esABB :: Ord a => AB a -> Bool que chequea si un árbol es un árbol binario de búsqueda.
Recordar que, en un árbol binario de búsqueda, el valor de un nodo es mayor o igual que los valores que
aparecen en el subárbol izquierdo y es estrictamente menor que los valores que aparecen en el subárbol
derecho.
v. Justificar la elección de los esquemas de recursión utilizados para los tres puntos anteriores.
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import GHC.Base (TrName(TrNameD))
{-# HLINT ignore "Eta reduce" #-}

data AB a = Nil | Bin (AB a) a (AB a) deriving Show
-- foldr :: (a -> b -> b) -> b -> [a] -> b 
foldAB :: (b -> a -> b -> b) -> b -> AB a -> b
foldAB f base Nil = base
foldAB f base (Bin izq valor der) = f (foldAB f base izq) valor (foldAB f base der)

recAB :: (AB a -> AB a -> b -> a -> b -> b) -> b -> AB a -> b
recAB f base (Bin izq valor der) = f izq der (recAB f base izq) valor (recAB f base der)

esNil :: AB a -> Bool
esNil Nil = True
esNil _   = False

{-
altura :: AB a -> Int
altura Nil = 0
altura (Bin izq _ der) = max (altura izq) (altura der) + 1

-}

altura :: AB a -> Int
altura arbol = foldAB (\izq valor der -> max izq der + 1) 0 arbol

{-
cantNodos :: AB a -> Int
cantNodos Nil = 0
cantNodos (Bin izq _ der) = 1 + cantNodos izq + cantNodos der
-}

cantNodos :: AB a -> Int
cantNodos = foldAB (\izq valor der -> izq + 1 + der) 0


-- Lo haré primero con recursión explicita (no veo porque les molesta tanto la recursión explicita, pero bueno)
{-
esABB :: Ord a => AB a -> Bool
esABB Nil = True
esABB (Bin izq valor der) =  (case izq of 
                                Nil -> True
                                Bin _ vIzq _ -> valor > vIzq)
                            && (case der of 
                                Nil -> True
                                Bin _ vDer _ -> valor > vDer) && esABB izq && esABB der
-}

{-

Tiene error pero debería ser algo así
esABB :: Ord a => AB a -> Bool
esABB = recAB (\ (Bin derIzq vIzq izqIzq) (Bin derDer vDer izqDer) izq val der ->
    if vIzq /= Nil then vIzq > val else if vDer /= Nil then vDer > val else True &&
    izq && der) True
    
-}
-- Para el último debía saber los valores de los próximos para poder calcular el valor de verdad de la expresión
-- Si no concocía los siguientes 2 valores, no podía asegurar nada

{-
mapAB :: (a -> b) -> AB a -> AB b
mapAB f Nil = Nil
mapAB f (Bin izq valor der) = Bin (mapAB f izq) (f valor) (mapAB f der)
-}

mapAB :: (a -> b) -> AB a -> AB b
mapAB f arbol = foldAB (\izq valor der -> Bin izq (f valor) der) Nil arbol