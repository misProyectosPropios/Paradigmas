import GHC.Exts.Heap (GenClosure(MutVarClosure))
 {- 
 Definir el esquema de recursión estructural para el siguiente tipo:
data Polinomio a = X
| Cte a
| Suma (Polinomio a) (Polinomio a)
| Prod (Polinomio a) (Polinomio a)
Luego usar el esquema definido para escribir la función evaluar :: Num a => a -> Polinomio a -> a
que, dado un número y un polinomio, devuelve el resultado de evaluar el polinomio dado en el número dado.
 
 -}
data Polinomio a = X | Cte a | Suma (Polinomio a) (Polinomio a) | Prod (Polinomio a) (Polinomio a)

foldPol :: (Polinomio a -> b -> b) -> b -> Polinomio a -> b 
foldPol f x X = x
foldPol f x (Cte valor) = x
foldPol f x y = f y (foldPol f x y)
{-
evaluar :: Num a => a -> Polinomio a -> a
evaluar evaluar pol = evaluar

-}
{-
Con recursión

evaluar :: Num a => a -> Polinomio a -> a
evaluar _ (Cte constante) = constante
evaluar valor (Suma x y) = evaluar valor x + evaluar valor y
evaluar valor (Prod x y) = evaluar valor x * evaluar valor y
evaluar valor _ = valor

-}