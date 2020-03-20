data Arbol a = H a | N a (Arbol a) (Arbol a) deriving (Show, Eq)
 
arbolPrueba :: Arbol Char
arbolPrueba = N 'a' (N 'b' (H 'c') (H 'd')) (H 'e')

numHojas :: Arbol a -> Int
numHojas (H _) = 1
numHojas (N x y z) = numHojas y + numHojas z

numNodos :: Arbol a -> Int
numNodos (H _) = 1
numNodos (N x y z) = 1 + numNodos y + numNodos z
 
profundidad :: Arbol a -> Int
profundidad (H _) = 0
profundidad (N x y z) = 1 + max (profundidad y) (profundidad z)
 
preorden :: Arbol a -> [a]
preorden (H x) = [x]
preorden (N x y z) = x : (preorden y ++ preorden z)

postorden :: Arbol a -> [a]
postorden (H x) = [x]
postorden (N x y z) = postorden y ++ postorden z ++ [x]
