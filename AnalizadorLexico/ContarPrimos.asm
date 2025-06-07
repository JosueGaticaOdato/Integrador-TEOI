include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
a1  ?
p1  ?
p2  ?
p3  ?
_numero 2 db "numero 2$"
b1  ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

displayString _numero 2
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

