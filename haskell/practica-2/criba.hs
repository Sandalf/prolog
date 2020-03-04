-- Criba de Eratóstenes
primos::Int -> [Int]
primos n = criba [2..n]

criba::[Int] -> [Int]
criba [] = []
criba (x:xs)
    | not (null xs) && x^2 > last xs = (x:xs)
    | otherwise = x: criba [y | y <- xs, y `mod` x /= 0]