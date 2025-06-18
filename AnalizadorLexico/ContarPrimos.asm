include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_13 dd 13.0
_12 dd 12.0
_a db "a$"
c dd ?
resultado dd ?
i dd ?
j dd ?
k dd ?
_0 dd 0.0
_1 dd 1.0
_2 dd 2.0
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
_@aux18 dd ?
_@aux19 dd ?
_@aux20 dd ?
_@aux21 dd ?
_@aux22 dd ?
_@aux23 dd ?
_@aux24 dd ?
_@aux25 dd ?
_@aux26 dd ?

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
frndint 
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
FSTSW AX
SAHF
JNE else_part7

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

fld _1
fstp i

fld _0
fstp j

inicio_while9:
FLD i
FLD _12
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while9
sentencias_while9:

FLD _12
FDIV i
FSTP _@aux10

fld _@aux10
frndint 
fistp c
FLD c
FLD i
FMUL 
FSTP _@aux11

FLD _12
FLD _@aux11
FSUB
FSTP _@aux12

fld _@aux12
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
fstp j

jmp end_if13
else_part13:

end_if13:

FLD i
FLD _1
FADD
FSTP _@aux15

fld _@aux15
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
fstp k

jmp end_if16
else_part16:

end_if16:

fld _1
fstp i

fld _0
fstp j

inicio_while18:
FLD i
FLD _13
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while18
sentencias_while18:

FLD _13
FDIV i
FSTP _@aux19

fld _@aux19
frndint 
fistp c
FLD c
FLD i
FMUL 
FSTP _@aux20

FLD _13
FLD _@aux20
FSUB
FSTP _@aux21

fld _@aux21
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part22

then_part22:
FLD j
FLD _1
FADD
FSTP _@aux23

fld _@aux23
fstp j

jmp end_if22
else_part22:

end_if22:

FLD i
FLD _1
FADD
FSTP _@aux24

fld _@aux24
fstp i
JMP inicio_while18
end_while18:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part25

then_part25:
FLD k
FLD _1
FADD
FSTP _@aux26

fld _@aux26
fstp k

jmp end_if25
else_part25:

end_if25:
; === FIN ContarPrimos ===

fld k
frndint 
fistp x

displayInteger x
newLine

displayString _a
newLine

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

