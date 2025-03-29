import GHC.Base (VecElem(Int16ElemRep))
import GHC.Exts.Heap (GenClosure(value))
inverso :: Float -> Maybe Float
inverso valor | valor /= 0 = Just (1 / valor)
              | otherwise = Nothing

aEntero :: Either Int Bool -> Int
aEntero (Left x)      = x
aEntero (Right True)  = 1
aEntero (Right False) = 0

