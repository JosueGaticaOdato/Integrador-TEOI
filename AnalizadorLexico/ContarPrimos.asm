include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
a dd ?
b dd ?
c dd ?
d dd ?
resultado dd ?
i dd ?
j dd ?
k dd ?
_0 dd 0.0
_1 dd 1.0
_2 dd 2.0
_4 dd 4.0
_5 dd 5.0
x dd ?
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
_@aux9 dd ?
_@aux10 dd ?
_@aux11 dd ?
_@aux12 dd ?
_@aux13 dd ?
_@aux14 dd ?
_@aux15 dd ?
_@aux16 dd ?
_@aux17 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _11
frndint 
fstp d

fld _5
frndint 
fstp a

fld _4
frndint 
fstp b
; === INICIO ContarPrimos ===

fld _0
frndint 
fstp k

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while0:
FLD i
FLD d
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while0
sentencias_while0:

FLD d
FDIV i
FSTP _@aux1

fld _@aux1
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux2

FLD d
FLD _@aux2
FSUB
FSTP _@aux3

fld _@aux3
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part4

then_part4:
FLD j
FLD _1
FADD
FSTP _@aux5

fld _@aux5
frndint 
fstp j

jmp end_if4
else_part4:

end_if4:

FLD i
FLD _1
FADD
FSTP _@aux6

fld _@aux6
frndint 
fstp i
JMP inicio_while0
end_while0:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part7

then_part7:
FLD k
FLD _1
FADD
FSTP _@aux8

fld _@aux8
frndint 
fstp k

jmp end_if7
else_part7:

end_if7:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while9:
FLD i
FLD null
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while9
sentencias_while9:

FLD null
FDIV i
FSTP _@aux10

fld _@aux10
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux11

FLD null
FLD _@aux11
FSUB
FSTP _@aux12

fld _@aux12
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part13

then_part13:
FLD j
FLD _1
FADD
FSTP _@aux14

fld _@aux14
frndint 
fstp j

jmp end_if13
else_part13:

end_if13:

FLD i
FLD _1
FADD
FSTP _@aux15

fld _@aux15
frndint 
fstp i
JMP inicio_while9
end_while9:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part16

then_part16:
FLD k
FLD _1
FADD
FSTP _@aux17

fld _@aux17
frndint 
fstp k

jmp end_if16
else_part16:

end_if16:
; === FIN ContarPrimos ===

fld k
frndint 
fistp x

displayInteger x
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

