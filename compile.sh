# Compile Brainfuck to an executable via haskell 
# First input must be brainfuck file and second input can be output program name
mv ./InputProg.hs ./InputProgExample.hs
cp ./InputProgEmpty.hs ./InputProg.hs
ghc ./CreateInputProg.hs -o cip
./cip $1
if [ "$2" = "" ]
  then
    OUTPUT=out
  else
    OUTPUT=$2
fi
ghc ./BrainfuckCompile.hs -o $OUTPUT
rm ./BrainfuckCompile.o
rm ./BrainfuckCompile.hi
rm ./Brainfuck.o
rm ./Brainfuck.hi
rm ./CreateInputProg.o
rm ./CreateInputProg.hi
rm ./InputProg.o
rm ./InputProg.hi
rm ./cip
rm ./InputProg.hs
mv ./InputProgExample.hs ./InputProg.hs
