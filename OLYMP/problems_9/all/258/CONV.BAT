copy input0%1%.txt input.txt
testconv.exe
copy output.txt input0%1%.txt
copy output.txt input.txt
solution.exe
copy output.txt answer0%1%.txt