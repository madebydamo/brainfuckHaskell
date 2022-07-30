module InputProg where
import Brainfuck
import Prelude hiding (Right, Left)

prog :: Program
prog = [Inc, Inc, Inc, Inc, Inc, Inc, Inc, Inc, Loop [Right, Inc, Inc, Inc, Inc, Loop [Right, Inc, Inc, Right, Inc, Inc, Inc, Right, Inc, Inc, Inc, Right, Inc, Left, Left, Left, Left, Dec], Right, Inc, Right, Inc, Right, Dec, Right, Right, Inc, Loop [Left], Left, Dec], Right, Right, Output, Right, Dec, Dec, Dec, Output, Inc, Inc, Inc, Inc, Inc, Inc, Inc, Output, Output, Inc, Inc, Inc, Output, Right, Right, Output, Left, Dec, Output, Left, Output, Inc, Inc, Inc, Output, Dec, Dec, Dec, Dec, Dec, Dec, Output, Dec, Dec, Dec, Dec, Dec, Dec, Dec, Dec, Output, Right, Right, Inc, Output, Right, Inc, Inc, Output]
