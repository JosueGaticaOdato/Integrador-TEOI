include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_1 dd 1
_2 dd 2
_5 dd 5
i dd ?
_10 dd 10
_@aux0 dd ?
_@aux1 dd ?
_@aux2 dd ?
_@aux3 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _1
fstp i

inicio_while0:
sentencias_while0:

then_part1:
FLD i
FLD _10
FADD
FSTP _@aux2

fld _@aux2
fstp i

jmp end_if1
else_part1:

end_if1:

FLD i
FLD _1
FADD
FSTP _@aux3

fld _@aux3
fstp i
JMP inicio_while0
end_while0:

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

