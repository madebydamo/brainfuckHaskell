import System.Directory.Internal.Prelude (getArgs)
import Brainfuck
import InputProg
main :: IO ()
main = do
  run prog emptyTape
  return ()
