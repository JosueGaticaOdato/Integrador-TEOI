include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_0 dd 0.0
_1 dd 1.0
c dd ?
_2 dd 2.0
resultado dd ?
x dd ?
i dd ?
j dd ?
k dd ?
_11 dd 11.0
_@aux0 dd ?
_@aux1 dd ?
_@aux2 dd ?
_@aux3 dd ?
_@aux4 dd ?
_@aux5 dd ?
_@aux6 dd ?
_@aux7 dd ?
_@aux8 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX
; === INICIO ContarPrimos ===

fld _0
fstp k

fld _1
fstp i

fld _0
fstp j

inicio_while0:
FLD i
FLD _11
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while0
sentencias_while0:

FLD _11
FDIV i
FSTP _@aux1

fld _@aux1
fistp c
FLD c
FLD i
FMUL 
FSTP _@aux2

FLD _11
FLD _@aux2
FSUB
FSTP _@aux3

fld _@aux3
fstp resultado

FLD resultado
FLD _0
FCOM
FSTSW AX
SAHF
JNE else_part4

then_part4:
FLD j
FLD _1
FADD
FSTP _@aux5

fld _@aux5
fstp j

jmp end_if4
else_part4:

end_if4:

FLD i
FLD _1
FADD
FSTP _@aux6

fld _@aux6
fstp i
JMP inicio_while0
end_while0:

FLD j
FLD _2
FXCH
FCOMP 
FSTSW ax
SAHF
JA else_part7
then_part7:
FLD k
FLD _1
FADD
FSTP _@aux8

fld _@aux8
fstp k

jmp end_if7
else_part7:

end_if7:
; === FIN ContarPrimos ===

fld k
fistp x

displayInteger x
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

