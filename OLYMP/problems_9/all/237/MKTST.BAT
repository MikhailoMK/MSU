for %%i in (*.pas) do dcc32 -cc %%i
for %%i in (*.dpr) do dcc32 -cc %%i
@echo off
copy 39_%1.tst input.txt >nul
39_solve
copy output.txt 39_%1.ans >nul
 