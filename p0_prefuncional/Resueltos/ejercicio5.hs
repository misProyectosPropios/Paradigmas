data AB a = Nil | Bin (AB a) a (AB a) deriving (Show)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

size :: AB Bool -> Int
size Nil = 0
size (Bin izq value der) = 1 + size izq + size der

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin izq value der) = Bin (negacionAB izq) (not value) (negacionAB der)

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin izq value der) = value * productoAB izq * productoAB der