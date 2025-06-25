include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
a dd ?
b dd ?
d dd ?
u dd ?
f dd ?
x dd ?
z dd ?
l dd ?
_1_point_2 dd 1.2
o dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

displayFloat _1_point_2, 2
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

