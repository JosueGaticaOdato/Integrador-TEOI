include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_1 dd 1.0
_2 dd 2.0
_5 dd 5.0
i dd ?
_i_es_2 db "i es 2$"
_@aux0 dd ?
_@aux1 dd ?
_@aux2 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _1
fstp i

inicio_while0:
FLD i
FLD _5
FXCH
FCOMP 
FSTSW ax
SAHF
JAE end_while0
sentencias_while0:

displayFloat i, 2
newLine

FLD i
FLD _2
FCOM
FSTSW AX
SAHF
JNE else_part1

then_part1:
displayString _i_es_2
newLine

jmp end_if1
else_part1:

end_if1:

FLD i
FLD _1
FADD
FSTP _@aux2

fld _@aux2
fstp i
JMP inicio_while0
end_while0:

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

