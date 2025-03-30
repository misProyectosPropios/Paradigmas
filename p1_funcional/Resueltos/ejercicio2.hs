-- Supongo que tengo una funcion que recibe 2 arguemntos y hace la suma
suma :: Num a => (a, a) -> a
suma (a, b) = a + b

producto :: Num a => a -> a -> a
producto a b = a * b

curryFunction :: ((a,b) -> c) -> a -> b -> c
curryFunction f a b = f (a, b)

uncurryFunction :: (a -> b -> c) -> (a,b) -> c
uncurryFunction f (a, b) = f a b 

curryN = undefined 

function = curryFunction suma
unfunction = uncurryFunction producto
