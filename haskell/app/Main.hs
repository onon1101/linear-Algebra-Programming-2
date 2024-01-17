module Main (main) where

import Lib

matrix_A :: (Num a) => [a]
matrix_A = [1, 2, 3, 2]

eigenvector :: Int -> [Int] -> [Int]
eigenvector ev (x1 : x2 : x3 : x4 : _) = ((x1 - ev) `div` (solveGCD x1 x4 ev)) : (x2 `div` (solveGCD x1 x4 ev)) : []
  where
    -- eigenvector ev (x1 : x2 : x3 : x4 : _) = (div (x1 - ev) (solveGCD x1 x4 ev)) : []

    solveGCD x1 x4 eigenvector = gcd (x1 - ev) (x4 - ev)

main :: IO ()
main = do
  -- putStrLn $ show $ det matrix_A
  putStrLn $ printPoly $ eigenvector 4 matrix_A

-- putStrLn $ show $ eigenvector 4 [1, 2, 3, 2]
