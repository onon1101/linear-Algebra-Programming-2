module Lib
  ( someFunc,
    det,
    -- eigenvector,
    printPoly,
  )
where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

matrixToPol :: (Num a) => [a] -> [a]
matrixToPol (x1 : x2 : x3 : x4 : _) = 1 : 0 - (x1 + x4) : (x1 * x4) - (x3 * x2) : []

solvePolPositive :: (Num a, Fractional a, Floating a) => [a] -> a
solvePolPositive (x1 : x2 : x3 : _) = (-x2 + sqrt (x2 * x2 - 4 * x1 * x3)) / 2 * x1

solvePolNega :: (Num a, Fractional a, Floating a) => [a] -> a
solvePolNega (x1 : x2 : x3 : _) = (-x2 - sqrt (x2 * x2 - 4 * x1 * x3)) / 2 * x1

det :: (Num a, Fractional a, Floating a) => [a] -> [a]
det matrix = (solvePolPositive $ matrixToPol matrix) : (solvePolNega $ matrixToPol matrix) : []

solveXYPoly :: (Num a) => a -> a -> a
solveXYPoly x1 eigenvalue = x1 - eigenvalue

printPoly :: (Num a, Show a) => [a] -> String
printPoly (x1 : x2 : _) = show x1 ++ "x_1+ " ++ show x2 ++ "x_2 = 0"
