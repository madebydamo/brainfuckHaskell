import Brainfuck

main :: IO Tape
main = runRepeat emptyTape

runRepeat :: Tape -> IO Tape
runRepeat tape = do 
  putStr "\n>"
  prog <- getLine
  tapeNew <- run (parse prog) tape
  runRepeat $! tapeNew

