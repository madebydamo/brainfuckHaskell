module Brainfuck where
import Prelude hiding (Left, Right)
import Data.Char

data Op = Inc | Dec | Left | Right | Input | Output | Loop Program deriving(Show)

type Program = [Op]

data Tape = Tape [Char] Char [Char]

emptyTape = Tape [chr 0, chr 0 ..] (chr 0) [chr 0, chr 0 ..]

goLeft :: Tape -> Tape
goLeft (Tape (l : lx) x rx) = Tape lx l (x : rx)
goLeft Tape {} = emptyTape

goRight :: Tape -> Tape
goRight (Tape lx x (r : rx)) = Tape (x : lx) r rx
goRight Tape {} = emptyTape

apply :: (Char -> Char) -> Tape -> Tape
apply f (Tape lx x rx) = Tape lx (f x) rx

getCurrent :: Tape -> Char
getCurrent (Tape _ x _) = x

parse :: String -> Program
parse input = snd (parseAux input)

parseAux :: String -> (String, Program)
parseAux "" = ([], [])
parseAux ('+' : sx) = (stringRes sx, Inc : progRes sx)
parseAux ('-' : sx) = (stringRes sx, Dec : progRes sx)
parseAux ('<' : sx) = (stringRes sx, Left : progRes sx)
parseAux ('>' : sx) = (stringRes sx, Right : progRes sx)
parseAux (',' : sx) = (stringRes sx, Input : progRes sx)
parseAux ('.' : sx) = (stringRes sx, Output : progRes sx)
parseAux ('[' : sx) = (stringRes (stringRes sx), Loop (progRes sx) : progRes (stringRes sx))
parseAux (']' : sx) = (sx, [])
parseAux (_ : sx) = parseAux sx

progRes :: String -> Program
progRes sx = snd (parseAux sx)

stringRes :: String -> String
stringRes sx = fst (parseAux sx)

run :: Program -> Tape -> IO Tape
run [] t = return t
run (Inc:p) t = run p (apply (\c -> chr (mod (ord c + 1) 128)) t)
run (Dec:p) t = run p (apply (\c -> chr (mod (ord c - 1) 128)) t)
run (Left:p) t = run p (goLeft t)
run (Right:p) t = run p (goRight t)
run (Input:p) t = do
    c <- getChar
    run p (apply (const c) t)
run (Output:p) t@(Tape _ x _) = do 
  putChar $ chr $ ord x
  run p t
run prog@(Loop pl:p) t = if getCurrent t /= chr 0 then run (pl ++ prog) t else run p t

q [] = []
q (x:xs) = q [e | e <- xs, e <= x] ++ x ++ q [e | e <- xs, e > x]
