include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_13 dd 13.0
_12 dd 12.0
_15 dd 15.0
_a db "a$"
_14 dd 14.0
c dd ?
_17 dd 17.0
resultado dd ?
_16 dd 16.0
_19 dd 19.0
_18 dd 18.0
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
_@aux63 dd ?
_@aux64 dd ?
_@aux65 dd ?
_@aux66 dd ?
_@aux67 dd ?
_@aux68 dd ?
_@aux69 dd ?
_@aux70 dd ?
_@aux71 dd ?
_@aux72 dd ?
_@aux73 dd ?
_@aux74 dd ?
_@aux75 dd ?
_@aux76 dd ?
_@aux77 dd ?
_@aux78 dd ?
_@aux79 dd ?
_@aux80 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX
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
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux11

FLD _12
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

fld _1
frndint 
fstp i

fld _0
frndint 
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
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux20

FLD _13
FLD _@aux20
FSUB
FSTP _@aux21

fld _@aux21
frndint 
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
frndint 
fstp j

jmp end_if22
else_part22:

end_if22:

FLD i
FLD _1
FADD
FSTP _@aux24

fld _@aux24
frndint 
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
frndint 
fstp k

jmp end_if25
else_part25:

end_if25:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while27:
FLD i
FLD _14
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while27
sentencias_while27:

FLD _14
FDIV i
FSTP _@aux28

fld _@aux28
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux29

FLD _14
FLD _@aux29
FSUB
FSTP _@aux30

fld _@aux30
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part31

then_part31:
FLD j
FLD _1
FADD
FSTP _@aux32

fld _@aux32
frndint 
fstp j

jmp end_if31
else_part31:

end_if31:

FLD i
FLD _1
FADD
FSTP _@aux33

fld _@aux33
frndint 
fstp i
JMP inicio_while27
end_while27:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part34

then_part34:
FLD k
FLD _1
FADD
FSTP _@aux35

fld _@aux35
frndint 
fstp k

jmp end_if34
else_part34:

end_if34:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while36:
FLD i
FLD _15
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while36
sentencias_while36:

FLD _15
FDIV i
FSTP _@aux37

fld _@aux37
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux38

FLD _15
FLD _@aux38
FSUB
FSTP _@aux39

fld _@aux39
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part40

then_part40:
FLD j
FLD _1
FADD
FSTP _@aux41

fld _@aux41
frndint 
fstp j

jmp end_if40
else_part40:

end_if40:

FLD i
FLD _1
FADD
FSTP _@aux42

fld _@aux42
frndint 
fstp i
JMP inicio_while36
end_while36:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part43

then_part43:
FLD k
FLD _1
FADD
FSTP _@aux44

fld _@aux44
frndint 
fstp k

jmp end_if43
else_part43:

end_if43:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while45:
FLD i
FLD _16
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while45
sentencias_while45:

FLD _16
FDIV i
FSTP _@aux46

fld _@aux46
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux47

FLD _16
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
JMP inicio_while45
end_while45:

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
FLD _17
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while54
sentencias_while54:

FLD _17
FDIV i
FSTP _@aux55

fld _@aux55
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux56

FLD _17
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

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while63:
FLD i
FLD _18
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while63
sentencias_while63:

FLD _18
FDIV i
FSTP _@aux64

fld _@aux64
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux65

FLD _18
FLD _@aux65
FSUB
FSTP _@aux66

fld _@aux66
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part67

then_part67:
FLD j
FLD _1
FADD
FSTP _@aux68

fld _@aux68
frndint 
fstp j

jmp end_if67
else_part67:

end_if67:

FLD i
FLD _1
FADD
FSTP _@aux69

fld _@aux69
frndint 
fstp i
JMP inicio_while63
end_while63:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part70

then_part70:
FLD k
FLD _1
FADD
FSTP _@aux71

fld _@aux71
frndint 
fstp k

jmp end_if70
else_part70:

end_if70:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while72:
FLD i
FLD _19
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while72
sentencias_while72:

FLD _19
FDIV i
FSTP _@aux73

fld _@aux73
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux74

FLD _19
FLD _@aux74
FSUB
FSTP _@aux75

fld _@aux75
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part76

then_part76:
FLD j
FLD _1
FADD
FSTP _@aux77

fld _@aux77
frndint 
fstp j

jmp end_if76
else_part76:

end_if76:

FLD i
FLD _1
FADD
FSTP _@aux78

fld _@aux78
frndint 
fstp i
JMP inicio_while72
end_while72:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part79

then_part79:
FLD k
FLD _1
FADD
FSTP _@aux80

fld _@aux80
frndint 
fstp k

jmp end_if79
else_part79:

end_if79:
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

