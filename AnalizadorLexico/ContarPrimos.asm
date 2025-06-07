include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_Estoy_utilizando db "Estoy utilizando$"

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

displayString _Estoy_utilizando
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

