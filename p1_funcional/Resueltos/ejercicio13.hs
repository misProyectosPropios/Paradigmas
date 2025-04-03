 
{-
Dado el tipo AB a del ejercicio 12:
i. Definir las funciones ramas (caminos desde la raíz hasta las hojas), cantHojas y espejo.
ii. Definir la función mismaEstructura :: AB a -> AB b -> Bool que, dados dos árboles, indica si éstos
tienen la misma forma, independientemente del contenido de sus nodos. Pista: usar evaluación parcial y
recordar el ejercicio 7.
-}

data AB a = Nil | Bin (AB a) a (AB a)

-- Lo hago de forma recurisva explicita y luego con foldAB

{-

cantHojas :: AB a -> Int
cantHojas Nil = 1
cantHojas (Bin izq valor der) = cantHojas izq + cantHojas der

-}

invertirAB :: AB a -> AB a
invertirAB Nil = Nil
invertirAB (Bin izq valor der) = Bin der valor izq

espejo :: AB a -> AB a
espejo Nil = Nil
espejo (Bin izq valor der) = Bin (espejo der) valor (espejo izq)