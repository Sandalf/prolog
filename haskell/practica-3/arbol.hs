--Este arbol es un nodo que contiene un elemento,
--de tipo generico a, y una lista de arboles 

data Arbol a = Nodo a [Arbol a]

-- Arbol de prueba
test :: Arbol Char
test = Nodo 'a' [(Nodo 'b' []), (Nodo 'c' [(Nodo 'e' []), (Nodo 'f' [(Nodo 'g' [])])]),(Nodo 'd' [])]

-- a
---- b
---- c
------ e
------ f
-------- g  
---- d

--Comprpobacion si un nodo es hoja
esHoja :: Arbol a -> Bool
esHoja (Nodo _ []) = True 
esHoja _ = False

{--Hojas
hojas :: Arbol a -> Int
    

--Nodos
nodos :: Arbol a -> Int


-}
--Valor Máximo de una lista 
maxlis :: (Ord a) => [a] -> a
maxlis lis = foldl1 max lis 

-- Altura de un arbol 
altura :: Arbol a -> Int
altura (Nodo _ []) = 0
altura (Nodo _ lis) = 1 + maxlis (map altura lis)

-- Profundidad de un arbol 
profundidad :: Arbol a -> Int
profundidad (Nodo _ []) = 0
profundidad (Nodo _ lis) = 1 + maxlis (map profundidad lis)

--concatena una lista
aplanar :: [[a]] -> [a]
aplanar [] = []
aplanar lis = foldl1 (++) lis

--recorrido en preorden
preorden :: Arbol a -> [a]
preorden (Nodo x []) = [x]
preorden (Nodo x lis ) = x : aplanar (map preorden lis)

--postorden
postorden :: Arbol a -> [a]
postorden (Nodo x []) = [x]
postorden (Nodo x lis) = (aplanar (map postorden lis)) ++ [x]

--niveles
niveles :: Arbol a -> [a]
niveles a = nivcol [a] where
    nivcol [] = []
    nivcol ((Nodo x lis):res) = x : nivcol (res ++ lis)

-- número de nodos
numNodos :: Arbol a -> Int
numNodos x = length (preorden x)

-- número de hojas
-- numHojasHelper :: Arbol a -> Int -> Int
-- numHojasHelper (Nodo x []) n = n
-- numHojasHelper (Nodo x lis) n = numHojasHelper lis (if lis == [] then n + 1 else n)

aplanarNums :: [[a]] -> Int
aplanarNums [] = []
aplanarNums lis = foldl1 (++) lis

numHojas :: Arbol a -> Int
numHojas (Nodo x []) = 1
numHojas (Nodo x lis) = map numHojas lis
-- numHojas x = numHojasHelper x 0s
