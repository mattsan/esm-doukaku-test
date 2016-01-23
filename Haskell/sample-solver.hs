module Solver where

solve = show.(\(f, s) -> (read f::Int) + (read (tail s)::Int)).break (\x -> x == '+')
