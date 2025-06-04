include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
msg dd ?
_0 dd 0
b dd ?
x dd ?
_8 dd 8
_numero 2 dd numero 2
z dd ?
_11 dd 11

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _0
fstp z

fld null
fstp x

fld _'numero_2'
fstp msg

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

