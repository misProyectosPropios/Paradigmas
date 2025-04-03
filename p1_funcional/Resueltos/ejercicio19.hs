 {-
Una tripla pitagórica es una tripla (a, b, c) de enteros positivos tal que a2 + b2 = c2.
La siguiente expresión intenta ser una definición de una lista (infinita) de triplas pitagóricas:
pitagóricas :: [(Integer, Integer, Integer)]
pitagóricas = [(a, b, c) | a <- [1..], b <-[1..], c <- [1..], a^2 + b^2 == c^2]

Esta definición no sirve porque solamente va a dar un número al tratar de terminar la lista c para luego pasar a la b
No va de forma totalmente aleatoria como funciona. Entonces no logra cubrir todo el espacio

-}

pitagóricas :: [(Integer, Integer, Integer)]
pitagóricas = [(a, b, c) | x <- [1..], a <- [1..x], b <- [a..x], c <- [b..x], a + b + c == x,a^2 + b^2 == c^2]