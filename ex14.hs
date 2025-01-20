-- suppose we want to define a data type that counts the number of transformations done to the data:
data COp a = CVal Int a
    deriving (Show)
-- is this an appropriate definition of a functor for COp?
instance Functor COp where
  fmap f (CVal c v)
      = CVal (c+1) (f v)
-- what if f = id?  what should we say about the number of transformations?
--      from lec14 "if we use id to transform what's inside the box, the result should be the same as before". Therefore,fmap id = id 
-- If f = id, this results in
-- fmap id (CVal c v)
--  = CVal (c + 1) (id v)
--  = CVal (c + 1) v
-- Notice that the count c is incremented, even though no actual transformation was performed on the value. 
-- This means that fmap id changes the structure, making it inappropriate.

-- define a functor for (->) r
instance Functor ((->) r) where
  fmap f g = f . g
