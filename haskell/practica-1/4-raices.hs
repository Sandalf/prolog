-- Definir la función raices de forma que (raices a b c) devuelve la lista de las raices reales de
-- la ecuación ax2 + bx + c = 0. 
formula :: Bool -> Double -> Double -> Double -> Double

formula signo a b c
    | signo == True = ((-b) + sqrt ((b**2) - (4*a*c))) / (2 * a) -- X1
    | otherwise = ((-b) - sqrt ((b**2) - (4*a*c))) / (2 * a) -- X2

printXs x1 x2 = "X1: " ++ show x1 ++ " X2: " ++ show x2

raices a b c = printXs (formula True a b c) (formula False a b c) 
