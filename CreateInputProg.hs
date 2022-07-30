import Brainfuck
import System.Environment
import System.IO

main :: IO ()
main = do
  args <- getArgs
  content <- readFile $ head args
  handle <- openFile "./InputProg.hs" AppendMode
  hPutStr handle (" " ++ show (parse $ filterContent content))
  hFlush handle
  hClose handle
  return ()

filterContent :: String -> String
filterContent = filter (`elem` "+-<>,.[]")
