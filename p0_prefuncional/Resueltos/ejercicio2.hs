
valorAbsoluto :: Float -> Float
valorAbsoluto x | x > 0 = x
               | otherwise = -x

factorial :: Int -> Int
factorial x | x == 0 = 1
       | otherwise = x * factorial (x - 1)

bisiesto :: Int -> Bool
bisiesto x | mod x 4 /= 0 = False
           | mod x 100 /= 0 = True
           | mod x 400 == 0 = True
           | otherwise = False

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x = cantDivisoresPrimosIteracion x 2


cantDivisoresPrimosIteracion :: Int -> Int -> Int
cantDivisoresPrimosIteracion objetivo index | objetivo < index = 0
                                            | mod objetivo index == 0 && esPrimo index = 1 + cantDivisoresPrimosIteracion objetivo (index + 1)
                                            | otherwise = cantDivisoresPrimosIteracion objetivo (index + 1)

esPrimo :: Int -> Bool
esPrimo x = esPrimoIteracion x 2

esPrimoIteracion :: Int -> Int -> Bool
esPrimoIteracion target index | target <= index = True
                              | mod target index == 0 = False
                              | otherwise = esPrimoIteracion target (index + 1)


