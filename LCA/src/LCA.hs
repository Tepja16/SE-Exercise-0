module LCA where 

data BinaryTree a = Empty 
                  | Node a (BinaryTree a) (BinaryTree a) 
                    deriving (Show) 

ancestorTree :: BinaryTree [Char]
ancestorTree =  Node "T"  
                    (Node "L"  
                        (Node "LL"  
                            (Node "LLL" Empty Empty)  
                            (Node "LLR" Empty Empty)  
                        )  
                        (Node "LR" 
                            (Node "LRL" Empty Empty)  
                            (Node "LRR" Empty Empty)  
                        )  
                    )     
                    (Node "R"  
                        (Node "RL"  
                            (Node "RLL" Empty Empty)  
                            (Node "RLR" Empty Empty)  
                        )  
                        (Node "RR"  
                            (Node "RRL" Empty Empty)  
                            (Node "RRR" Empty Empty)  
                        )  
                    )    

lca :: Eq a => BinaryTree a -> a -> a -> Either Bool a
lca Empty _ _ = Left False
lca (Node v tl tr) n1 n2 
    | v == n1 || v == n2 = Right v
    | l /= Left False && r /= Left False = Right v
    | otherwise = if l /= Left False then l else r
    where
        l = lca tl n1 n2 
        r = lca tr n1 n2

{-

### The below design also works ###


lca :: Eq a => BinaryTree a -> a -> a -> Either Bool a
lca Empty _ _ = Left False
lca (Node v tl tr) n1 n2 = 
    let l = lca tl n1 n2
        r = lca tr n1 n2
        onroot = v == n1 || v == n2
    in case (l, r, onroot) of
        (Right a  , _         , _    ) -> Right a
        (_        , Right a   , _    ) -> Right a
        (Left True, Left True , _    ) -> Right v
        (Left True, _         , True ) -> Right v
        (_        , Left True , True ) -> Right v
        (Left True, _         , False) -> Left True
        (_         , Left True, False) -> Left True
        (_         , _        , True ) -> Left True
        _ -> Left False
-}


