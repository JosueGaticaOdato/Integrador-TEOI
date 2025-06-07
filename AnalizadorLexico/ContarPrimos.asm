include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_1 dd 1.0
i dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _1
fstp i

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

