@echo off

set project_name=PoretGBGame
set src=Z:\Projects\Gameboy\%project_name%
set bgb=Z:\Emulation\Nintendo\GB\bgb\bgb.exe

C:\windows\system32\taskkill /IM bgb.exe /F
del rom\%project_name%.gb

path=Z:\Projects\Gameboy\bin

rgbasm	-o inc\hardware.o inc\hardware.inc
rgbasm 	-o src\tiles.o src\tiles.z80
rgbasm	-o src\%project_name%.o src\%project_name%.z80 

echo LINKING...

rgblink -o rom\%project_name%.gb inc\hardware.o src\tiles.o src\%project_name%.o  

echo FIXING...

rgbfix -p0 -v rom\%project_name%.gb

del src\%project_name%.o
del src\tiles.o
del inc\hardware.o

START %bgb% rom\%project_name%.gb