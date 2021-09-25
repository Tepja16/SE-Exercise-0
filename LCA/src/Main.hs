module Main where

import LCA


main :: IO ()
main = do 
  putStrLn "Enter in the first node: "
  n1 <- getLine
  putStrLn "Enter in the second node: "
  n2 <- getLine
  putStrLn $ findLca n1 n2

  
findLca :: [Char] -> [Char] -> [Char]
findLca n1 n2 = 
  case lca ancestorTree n1 n2 of
    Right a ->  "The LCA of [" ++ n1 ++ "] and [" ++ n2 ++ "] is [" ++ a ++ "]"
    _ -> "Undefined. One or both nodes do not occur in the tree."

