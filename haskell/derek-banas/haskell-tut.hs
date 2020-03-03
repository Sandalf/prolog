-- Comments
{-
    Multiline
-}

import Data.List;
import System.IO;

-- Int -2^63 2^63
-- maxInt = maxBound :: Int

-- Double
-- Char
-- Tuple

-- always5 :: Int
-- always5 = 5

-- sumOfNums = sum [1..1000]

-- addEx = 5 + 4;
-- subEx = 5 - 4;
-- multEx = 5 * 4;
-- divEx = 5 / 4;

-- modEx = mod 5 4
-- modEx2 = 5 `mod` 4

-- negNumEx = 5 + (-4)

-- num9 = 9 :: Int
-- sqrtOf9 = sqrt (fromIntegral num9) 

-- piVal = pi
-- ePow9 = exp 9
-- logOf9 = log 9
-- squared9 = 9 ** 2
-- truncateVal = truncate 9.999
-- roundVal = round 9.999
-- ceilingVal = ceiling 9.999
-- floorVal = floor 9.999

-- trueAndFalse = True && False
-- trueOrFalse = True || False
-- notTrue = not(True)

{-
primeNumbers = [3,5,7,11]

morePrimes = primeNumbers ++ [13,17,19,23,29]

favNum = 2 : 7 : 21 : 66 :[]

multList = [[3,5,7],[11,13,17]]

morePrimes2 = 2 : morePrimes

lenPrime = length morePrimes2

revPrime = reverse morePrimes2

isListEmpty = null morePrimes2

secondPrime = morePrimes2 !! 1

firstPrime = head morePrimes2

lastPrime = last morePrimes2

primeInit = init morePrimes2

first3Primes = take 3 morePrimes2

removedPrimes = drop 3 morePrimes2

is7InList = elem 7 morePrimes2

maxPrime = maximum morePrimes2

minPrime = minimum morePrimes2

newList = [2,3,5]

productPrimes = product newList

zeroToTen = [0..10]

evenList = [2,4..20]

letterList = ['A','C'..'Z']

infinPow10 = [10,20..]

many2s = take 10 (repeat 2)

many3s = replicate 10 3

cycleList = take 10 (cycle [1,2,3,4,5])

listTimes2 = [x * 2 | x <- [1..10]]

listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]

divBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

sortedList = sort [9,2,6,1,8,3]

sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

listBiggerThan5 = filter (>5) morePrimes

evensUpTo20 = takeWhile (<=20) [2,4..]

fivesUpTo50 = takeWhile (<=50) [5,10..]

multOfList = foldl (*) 1 [2,3,4,5]

multTable = [[x * y | y <- [1..10]] | x <- [1..10]]
-}

{-
randTuple = (1,"Random Tuple")

bobSmith = ("Bob Smith", 52)

bobsName = fst bobSmith

bobsAge = snd bobSmith

names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]

namesNAddress = zip names addresses
-}


-- main = do
--     putStrLn "What's your name"
--     name <- getLine
--     putStrLn ("Hello " ++ name)

-- addMe :: Int -> Int -> Int

-- funcName param1 param2 = operations (returned value)

-- addMe x y = x + y

-- sumMe x y = x + y

-- addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)

-- addTuples (x, y) (x2, y2) = (x + x2, y + y2)

-- whatAge :: Int -> String

-- whatAge 16 = "You can drive"
-- whatAge 18 = "You can vote"
-- whatAge 21 = "You can drink"
-- whatAge x = "Nothing important"

-- factorial :: Int -> Int

-- factorial 0 = 1
-- factorial n = n * factorial (n - 1)

-- prodFact n = product [1..n]

-- isOdd :: Int -> Bool

-- isOdd n
--     | n `mod` 2 == 0 = False
--     | otherwise = True

-- isEven n = n `mod` 2 == 0

-- whatGrade :: Int -> String

-- whatGrade age
--     | (age >= 5) && (age <= 6) = "Kindergarten"
--     | (age > 6) && (age <= 10) = "Elementary School"
--     | (age > 10) && (age <= 14) = "Middle School"
--     | (age >= 14) && (age <= 18) = "High School"
--     | otherwise = "Go to college"

-- batAvgRating :: Double -> Double -> String

-- batAvgRating hits atBats
--     | avg <= 0.200 = "Terrible Batting Average"
--     | avg <= 0.250 = "Average Player"
--     | avg <= 0.280 = "You're doing pretty cool"
--     | otherwise = "You're a superstar"
--     where avg = hits / atBats


