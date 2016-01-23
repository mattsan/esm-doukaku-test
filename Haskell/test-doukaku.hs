-- $ ghc --make test-doukaku sample-solver

module Main where

import System.Environment
import System.IO
import Solver(solve)

test [input, expected] = 
  putStr result
  where
    actual = solve input
    result = if actual == expected
               then
                 "."
               else
                 "\ninput:    " ++ input    ++
                 "\nexpected: " ++ expected ++
                 "\nactual:   " ++ actual   ++ "\n"

main = do
  dataFile <- getArgs
  openFile (head dataFile) ReadMode >>= hGetContents >>= mapM_ (test.words).lines >> putStrLn ""
