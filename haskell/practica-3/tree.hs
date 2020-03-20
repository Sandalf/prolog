data Arbol a = H a
             | N a (Arbol a) (Arbol a)
             deriving (Show, Eq)
 
test :: Arbol Char
test = N '9' (N '3' (H '2') (H '4')) (H '7')

nHojas :: Arbol a -> Int
nHojas (H _) = 1
nHojas (N x i d) = nHojas i + nHojas d

nNodos :: Arbol a -> Int
nNodos (H _) = 0
nNodos (N x i d) = 1 + nNodos i + nNodos d
 
profundidad :: Arbol a -> Int
profundidad (H _)     = 0
profundidad (N x i d) = 1 + max (profundidad i) (profundidad d)
 
preorden :: Arbol a -> [a]
preorden (H x)     = [x]
preorden (N x i d) = x : (preorden i ++ preorden d)

postorden :: Arbol a -> [a]
postorden (H x)     = [x]
postorden (N x i d) = postorden i ++ postorden d ++ [x]
