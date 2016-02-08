.386
.model         flat,stdcall
option         casemap:none

include       include\windows.inc
include       include\kernel32.inc
include       include\masm32.inc
include       include\msvcrt.inc


includelib     C:\masm32\lib\kernel32.lib
includelib     C:\masm32\lib\msvcrt.lib

.data 

__arg          db 'HAX0R5_W0RLD',00h

.code

start:         
 
 mov          ebx,$+025h  
 mov          dword ptr[esp + 04h],offset __arg
 mov          dword ptr[esp],ebx
 mov          byte  ptr[$+013h],0ffh    
 mov          eax,dword ptr[crt_printf]
 mov          byte ptr[$+08h],0e0h
 

 

 


end start