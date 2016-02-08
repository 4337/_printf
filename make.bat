@echo off

C:\masm32\bin\ml.exe /c /coff /I C:\masm32 _printf_.asm
C:\masm32\bin\link.exe /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib /OUT:test.exe _printf_.obj

del _printf_.obj

pause