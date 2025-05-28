include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_0  0
b  -
_1  1
_2  2
_5  5
i  -
z  -
_@aux0 dd ?
_@aux1 dd ?

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

fld _1
fstp i

inicio_while0:
sentencias_while0:

then_part1:
fld _1
fstp z

jmp end_if1
else_part1:

end_if1:
JMP inicio_while0
end_while0:

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

