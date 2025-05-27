include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _0
fstp z

fld _2
fstp b

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

