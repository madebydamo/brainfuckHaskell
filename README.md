# Brainfuck in Haskell
A brainfuck compiler and interpreter written in Haskell

## Usage

Run `./compile.sh brainfuckfile [outputfile]` to compile a brainfuck programm to an executable. The output file is by default named "out"

Run `ghci BrainfuckInterpreter.hs` to start ghci with the interpreter loaded. To start the session call `main`, after that you can enter code that gets executed on enter automatically.

## Dependencies

The shell script compile.sh relies on ghc and is only executable on linux/unix.
### Example

./compile.sh tictactoe.fuck tictactoe

### For the courious ones
The interesting code is in Brainfuck.hs, where the Input gets parsed and executed. If you have similar ideas, this class can be copied as a standalone module.
