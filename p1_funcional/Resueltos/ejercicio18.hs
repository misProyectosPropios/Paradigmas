 
paresDeNat :: [(Int, Int)]
paresDeNat = [(y,z) | x <- [1..], y <- [0..x], z <- [0..x], y + z == x]

-- Este era que sean todos los que sumen hasta x