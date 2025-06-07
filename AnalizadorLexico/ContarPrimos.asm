include macros2.asm
include number.asm
.MODEL LARGE 
.386
.STACK  200h 

; vars from symbol table and aux vars
.DATA
a1 dd ?
p1 dd ?
p2 dd ?
_1 dd 1.0
p3 dd ?
_2 dd 2.0
i dd ?
_i_es_2 db "i es 2$"
_i_es_1 db "i es 1$"
b1 dd ?
_@aux0 dd ?

; program instructions
.CODE
START:
MOV EAX,@DATA
MOV DS,EAX
MOV ES,EAX

fld _1
fstp i

then_part0:
displayString _i_es_2
newLine

jmp end_if0
else_part0:

displayString _i_es_1
newLine

end_if0:

; end of execution
MOV EAX, 4C00h
INT 21h
END START
;

