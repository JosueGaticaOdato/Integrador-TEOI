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
resultado dd ?
f dd ?
i dd ?
j dd ?
k dd ?
_0 dd 0.0
_1 dd 1.0
_2 dd 2.0
x dd ?
_7 dd 7.0
_8 dd 8.0
z dd ?
_53 dd 53.0
_11 dd 11.0
_55 dd 55.0
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
_@aux27 dd ?
_@aux28 dd ?
_@aux29 dd ?
_@aux30 dd ?
_@aux31 dd ?
_@aux32 dd ?
_@aux33 dd ?
_@aux34 dd ?
_@aux35 dd ?
_@aux36 dd ?
_@aux37 dd ?
_@aux38 dd ?
_@aux39 dd ?
_@aux40 dd ?
_@aux41 dd ?
_@aux42 dd ?
_@aux43 dd ?
_@aux44 dd ?
_@aux45 dd ?
_@aux46 dd ?
_@aux47 dd ?
_@aux48 dd ?
_@aux49 dd ?
_@aux50 dd ?
_@aux51 dd ?
_@aux52 dd ?
_@aux53 dd ?
_@aux54 dd ?
_@aux55 dd ?
_@aux56 dd ?
_@aux57 dd ?
_@aux58 dd ?
_@aux59 dd ?
_@aux60 dd ?
_@aux61 dd ?
_@aux62 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _0
frndint 
fstp z

fld _2
frndint 
fstp a

fld _2
frndint 
fstp b

fld _53
frndint 
fstp f
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
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux2

FLD _11
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
FLD b
FLD _8
FADD
FSTP _@aux10

FLD i
FLD _@aux10
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while9
sentencias_while9:

FLD b
FLD _8
FADD
FSTP _@aux11

FLD _@aux11
FDIV i
FSTP _@aux12

fld _@aux12
frndint 
fstp c

FLD b
FLD _8
FADD
FSTP _@aux13
FLD c
FLD i
FMUL 
FSTP _@aux14

FLD _@aux13
FLD _@aux14
FSUB
FSTP _@aux15

fld _@aux15
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part16

then_part16:
FLD j
FLD _1
FADD
FSTP _@aux17

fld _@aux17
frndint 
fstp j

jmp end_if16
else_part16:

end_if16:

FLD i
FLD _1
FADD
FSTP _@aux18

fld _@aux18
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
JNE else_part19

then_part19:
FLD k
FLD _1
FADD
FSTP _@aux20

fld _@aux20
frndint 
fstp k

jmp end_if19
else_part19:

end_if19:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while21:
FLD i
FLD _2
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while21
sentencias_while21:

FLD _2
FDIV i
FSTP _@aux22

fld _@aux22
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux23

FLD _2
FLD _@aux23
FSUB
FSTP _@aux24

fld _@aux24
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part25

then_part25:
FLD j
FLD _1
FADD
FSTP _@aux26

fld _@aux26
frndint 
fstp j

jmp end_if25
else_part25:

end_if25:

FLD i
FLD _1
FADD
FSTP _@aux27

fld _@aux27
frndint 
fstp i
JMP inicio_while21
end_while21:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part28

then_part28:
FLD k
FLD _1
FADD
FSTP _@aux29

fld _@aux29
frndint 
fstp k

jmp end_if28
else_part28:

end_if28:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while30:
FLD i
FLD _55
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while30
sentencias_while30:

FLD _55
FDIV i
FSTP _@aux31

fld _@aux31
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux32

FLD _55
FLD _@aux32
FSUB
FSTP _@aux33

fld _@aux33
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part34

then_part34:
FLD j
FLD _1
FADD
FSTP _@aux35

fld _@aux35
frndint 
fstp j

jmp end_if34
else_part34:

end_if34:

FLD i
FLD _1
FADD
FSTP _@aux36

fld _@aux36
frndint 
fstp i
JMP inicio_while30
end_while30:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part37

then_part37:
FLD k
FLD _1
FADD
FSTP _@aux38

fld _@aux38
frndint 
fstp k

jmp end_if37
else_part37:

end_if37:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while39:FLD z
FLD b
FMUL 
FSTP _@aux40

FLD _@aux40
FLD _7
FADD
FSTP _@aux41

FLD i
FLD _@aux41
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while39
sentencias_while39:
FLD z
FLD b
FMUL 
FSTP _@aux42

FLD _@aux42
FLD _7
FADD
FSTP _@aux43

FLD _@aux43
FDIV i
FSTP _@aux44

fld _@aux44
frndint 
fstp c
FLD z
FLD b
FMUL 
FSTP _@aux45

FLD _@aux45
FLD _7
FADD
FSTP _@aux46
FLD c
FLD i
FMUL 
FSTP _@aux47

FLD _@aux46
FLD _@aux47
FSUB
FSTP _@aux48

fld _@aux48
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part49

then_part49:
FLD j
FLD _1
FADD
FSTP _@aux50

fld _@aux50
frndint 
fstp j

jmp end_if49
else_part49:

end_if49:

FLD i
FLD _1
FADD
FSTP _@aux51

fld _@aux51
frndint 
fstp i
JMP inicio_while39
end_while39:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part52

then_part52:
FLD k
FLD _1
FADD
FSTP _@aux53

fld _@aux53
frndint 
fstp k

jmp end_if52
else_part52:

end_if52:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while54:
FLD i
FLD f
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while54
sentencias_while54:

FLD f
FDIV i
FSTP _@aux55

fld _@aux55
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux56

FLD f
FLD _@aux56
FSUB
FSTP _@aux57

fld _@aux57
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part58

then_part58:
FLD j
FLD _1
FADD
FSTP _@aux59

fld _@aux59
frndint 
fstp j

jmp end_if58
else_part58:

end_if58:

FLD i
FLD _1
FADD
FSTP _@aux60

fld _@aux60
frndint 
fstp i
JMP inicio_while54
end_while54:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part61

then_part61:
FLD k
FLD _1
FADD
FSTP _@aux62

fld _@aux62
frndint 
fstp k

jmp end_if61
else_part61:

end_if61:
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

