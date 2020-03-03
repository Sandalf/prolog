-- Programa que calcule los números perfectos hasta n, siendo n un número positivo.
isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n
    | (length [x | x <- [2 .. n-1], mod n x == 0]) > 0 = False
    | otherwise = True

perfs n = [(2 ^ (n - 1)) * ((2 ^ n) - 1) | n <- filter isPrime [2..n]]
