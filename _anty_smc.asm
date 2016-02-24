.386
.model         flat,stdcall
option         casemap:none

include       include\windows.inc
include       include\kernel32.inc
include       include\masm32.inc
include       include\msvcrt.inc


includelib     C:\masm32\lib\kernel32.lib
includelib     C:\masm32\lib\msvcrt.lib

assume     fs:nothing

m__call macro function 
   
   mov     eax,function
   mov     dword ptr[esp+4],eax      
   mov     ebx,dword ptr fs:[0]     
   mov     dword ptr [esp],ebx       
   mov     dword ptr fs:[0],esp      
   mov     eax,0
   mov     dword ptr [eax],eax
   
endm

.data 

__arg      db 'HAX0R5_W0RLD',00h
__add      db 0
__seh      dd 0

.code

start:        
 
  mov     eax,dword ptr fs:[0]
  mov     __seh,eax
 
  mov     eax, callme
  m__call callme           ;we can't use seh for library call due to secutrity mitigation 
  
  ;ret

callme: 
  ;nop
  ;nop
  mov     eax,__seh
  mov     dword ptr fs:[0],eax
  
  mov     ebx,$+025h  
  mov     dword ptr[esp + 04h],offset __arg
  mov     dword ptr[esp],ebx
  mov     byte  ptr[$+013h],0ffh    
  mov     eax,dword ptr[crt_printf]
  mov     byte ptr[$+08h],0e0h
 
 db       010h dup(090h)
 
 ;ret
 
end start