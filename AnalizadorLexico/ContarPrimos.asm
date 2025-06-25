include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
_o_no_es_2 db "o no es 2$"
a dd ?
b dd ?
c dd ?
d dd ?
resultado dd ?
f dd ?
i dd ?
j dd ?
k dd ?
l dd ?
o dd ?
_0 dd 0.0
_1 dd 1.0
_2 dd 2.0
_5 dd 5.0
x dd ?
_7 dd 7.0
_8 dd 8.0
z dd ?
_o_es_2 db "o es 2$"
_53 dd 53.0
_l_es_2 db "l es 2$"
_11 dd 11.0
_55 dd 55.0
_l_es_1 db "l es 1$"
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

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _1
frndint 
fstp l

FLD l
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part0

then_part0:
displayString _l_es_2
newLine

jmp end_if0
else_part0:

displayString _l_es_1
newLine

end_if0:

fld _1
frndint 
fstp o

inicio_while1:
FLD o
FLD _5
FXCH
FCOMP 
FSTSW ax
SAHF
JAE end_while1
sentencias_while1:

FLD o
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part2

then_part2:
displayString _o_es_2
newLine

jmp end_if2
else_part2:

displayString _o_no_es_2
newLine

end_if2:

FLD o
FLD _1
FADD
FSTP _@aux3

fld _@aux3
frndint 
fstp o
JMP inicio_while1
end_while1:

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
fstp d
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

inicio_while4:
FLD i
FLD _11
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while4
sentencias_while4:

FLD _11
FDIV i
FSTP _@aux5

fld _@aux5
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux6

FLD _11
FLD _@aux6
FSUB
FSTP _@aux7

fld _@aux7
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part8

then_part8:
FLD j
FLD _1
FADD
FSTP _@aux9

fld _@aux9
frndint 
fstp j

jmp end_if8
else_part8:

end_if8:

FLD i
FLD _1
FADD
FSTP _@aux10

fld _@aux10
frndint 
fstp i
JMP inicio_while4
end_while4:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part11

then_part11:
FLD k
FLD _1
FADD
FSTP _@aux12

fld _@aux12
frndint 
fstp k

jmp end_if11
else_part11:

end_if11:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while13:
FLD b
FLD _8
FADD
FSTP _@aux14

FLD i
FLD _@aux14
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while13
sentencias_while13:

FLD b
FLD _8
FADD
FSTP _@aux15

FLD _@aux15
FDIV i
FSTP _@aux16

fld _@aux16
frndint 
fstp c

FLD b
FLD _8
FADD
FSTP _@aux17
FLD c
FLD i
FMUL 
FSTP _@aux18

FLD _@aux17
FLD _@aux18
FSUB
FSTP _@aux19

fld _@aux19
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part20

then_part20:
FLD j
FLD _1
FADD
FSTP _@aux21

fld _@aux21
frndint 
fstp j

jmp end_if20
else_part20:

end_if20:

FLD i
FLD _1
FADD
FSTP _@aux22

fld _@aux22
frndint 
fstp i
JMP inicio_while13
end_while13:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part23

then_part23:
FLD k
FLD _1
FADD
FSTP _@aux24

fld _@aux24
frndint 
fstp k

jmp end_if23
else_part23:

end_if23:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while25:
FLD i
FLD _2
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while25
sentencias_while25:

FLD _2
FDIV i
FSTP _@aux26

fld _@aux26
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux27

FLD _2
FLD _@aux27
FSUB
FSTP _@aux28

fld _@aux28
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part29

then_part29:
FLD j
FLD _1
FADD
FSTP _@aux30

fld _@aux30
frndint 
fstp j

jmp end_if29
else_part29:

end_if29:

FLD i
FLD _1
FADD
FSTP _@aux31

fld _@aux31
frndint 
fstp i
JMP inicio_while25
end_while25:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part32

then_part32:
FLD k
FLD _1
FADD
FSTP _@aux33

fld _@aux33
frndint 
fstp k

jmp end_if32
else_part32:

end_if32:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while34:
FLD i
FLD _55
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while34
sentencias_while34:

FLD _55
FDIV i
FSTP _@aux35

fld _@aux35
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux36

FLD _55
FLD _@aux36
FSUB
FSTP _@aux37

fld _@aux37
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part38

then_part38:
FLD j
FLD _1
FADD
FSTP _@aux39

fld _@aux39
frndint 
fstp j

jmp end_if38
else_part38:

end_if38:

FLD i
FLD _1
FADD
FSTP _@aux40

fld _@aux40
frndint 
fstp i
JMP inicio_while34
end_while34:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part41

then_part41:
FLD k
FLD _1
FADD
FSTP _@aux42

fld _@aux42
frndint 
fstp k

jmp end_if41
else_part41:

end_if41:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while43:FLD z
FLD b
FMUL 
FSTP _@aux44

FLD _@aux44
FLD _7
FADD
FSTP _@aux45

FLD i
FLD _@aux45
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while43
sentencias_while43:
FLD z
FLD b
FMUL 
FSTP _@aux46

FLD _@aux46
FLD _7
FADD
FSTP _@aux47

FLD _@aux47
FDIV i
FSTP _@aux48

fld _@aux48
frndint 
fstp c
FLD z
FLD b
FMUL 
FSTP _@aux49

FLD _@aux49
FLD _7
FADD
FSTP _@aux50
FLD c
FLD i
FMUL 
FSTP _@aux51

FLD _@aux50
FLD _@aux51
FSUB
FSTP _@aux52

fld _@aux52
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part53

then_part53:
FLD j
FLD _1
FADD
FSTP _@aux54

fld _@aux54
frndint 
fstp j

jmp end_if53
else_part53:

end_if53:

FLD i
FLD _1
FADD
FSTP _@aux55

fld _@aux55
frndint 
fstp i
JMP inicio_while43
end_while43:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part56

then_part56:
FLD k
FLD _1
FADD
FSTP _@aux57

fld _@aux57
frndint 
fstp k

jmp end_if56
else_part56:

end_if56:

fld _1
frndint 
fstp i

fld _0
frndint 
fstp j

inicio_while58:
FLD i
FLD d
FXCH
FCOMP 
FSTSW ax
SAHF
JA end_while58
sentencias_while58:

FLD d
FDIV i
FSTP _@aux59

fld _@aux59
frndint 
fstp c
FLD c
FLD i
FMUL 
FSTP _@aux60

FLD d
FLD _@aux60
FSUB
FSTP _@aux61

fld _@aux61
frndint 
fstp resultado

FLD resultado
FLD _0
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part62

then_part62:
FLD j
FLD _1
FADD
FSTP _@aux63

fld _@aux63
frndint 
fstp j

jmp end_if62
else_part62:

end_if62:

FLD i
FLD _1
FADD
FSTP _@aux64

fld _@aux64
frndint 
fstp i
JMP inicio_while58
end_while58:

FLD j
FLD _2
FXCH
FCOMP
FSTSW AX
SAHF
JNE else_part65

then_part65:
FLD k
FLD _1
FADD
FSTP _@aux66

fld _@aux66
frndint 
fstp k

jmp end_if65
else_part65:

end_if65:
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

