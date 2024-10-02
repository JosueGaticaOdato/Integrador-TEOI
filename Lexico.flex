package app;
import java_cup.runtime.*;
import java.util.*;

%%


%cup
%public
%class Lexico
%line
%column
%char


LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+

/*Comentarios*/

COMENTARIO = "/*" ~ "*/" // El ~ incluye cualquier caracter

//Operadores aritmeticos

OP_ASIGNACION = "::="
OP_DECLARACION = ":="
OP_SUMA = "+"
OP_RESTA = "-"
OP_DIVISION = "/"
OP_MULTIPLICACION = "*"
OP_MODULO = "%"
OP_POTENCIA = "^"

//Operadores logicos

OP_MENOR = "<"
OP_MAYOR = ">"
OP_MAYOR_IGUAL = ">="
OP_MENOR_IGUAL = "<="
OP_IGUAL = "=="
OP_DISTINTO = "!="
OP_AND = "AND"
OP_OR = "OR"
OP_NOT = "NOT"

//Simbolos

PARENTESIS_ABRE = "("
PARENTESIS_CIERRA = ")"
LLAVE_ABRE = "{"
LLAVE_CIERRA = "}"
CORCHETE_ABRE = "["
CORCHETE_CIERRA = "]"
PUNTO_COMA = ";"
COMA = ","
PUNTO = "."
DOS_PUNTOS = ":"

//Ids y tabla

WRITE = "WRITE"
ID = {LETRA} ({LETRA}|{DIGITO})*
CONST_INT = {DIGITO}+
CONST_STR = "'" ({DIGITO}|{LETRA}|{ESPACIO})* "'" 
CONST_BIN = "(" {ESPACIO}* ("0"|"1")+ {ESPACIO}* "," {ESPACIO}* "2" {ESPACIO}* ")"
CONST_HEX = "(" {ESPACIO}* ({DIGITO} | "A" | "B" | "C" | "D" | "E" | "F")+ {ESPACIO}* "," {ESPACIO}* "16" {ESPACIO}* ")"

INTEGER = "INTEGER"|"integer"|"Integer"
STRING = "STRING"|"string"|"String"
FLOAT = "FLOAT"|"float"|"Float"

//Palabras reservadas

WHILE = "WHILE" |"while"|"While"
DO = "DO" |"do"|"Do"
IF = "IF" |"if"|"If"
THEN = "THEN"|"then"|"Then"
ELSE = "ELSE"|"else"|"Else"
WRITE = "WRITE"|"write"|"Write"
DECLARE = "DECLARE"|"declare"|"Declare"
ENDDECLARE = "ENDDECLARE"|"enddeclare"|"Enddeclare"
PROGRAM_SECTION = "PROGRAMSECTION"|"programsection"|"ProgramSection"
ENDPROGRAM_SECTION = "ENDPROGRAMSECTION"|"endprogramsection"|"EndProgramSection"
CONTAR_PRIMOS = "CONTARPRIMOS"|"contarprimos"|"ContarPrimos"|"contarPrimos"

%%

<YYINITIAL> {

// -------------------- Operadores aritmeticos-------------------------

{OP_ASIGNACION}		{System.out.println("Token OP_ASIGNACION encontrado, Lexema: "+ yytext());}

{OP_DECLARACION}		{System.out.println("Token OP_DECLARACION encontrado, Lexema: "+ yytext());}

{OP_SUMA}		{System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());}

{OP_RESTA}		{System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());}

{OP_DIVISION}		{System.out.println("Token OP_DIVISION encontrado, Lexema "+ yytext());}

{OP_MULTIPLICACION}		{System.out.println("Token OP_MULTIPLICACION encontrado, Lexema "+ yytext());}

{OP_MODULO}		{System.out.println("Token OP_MOD encontrado, Lexema "+ yytext());}

{OP_POTENCIA}		{System.out.println("Token OP_POTENCIA encontrado, Lexema "+ yytext());}

// -------------------- Operadores logicos -------------------------

{OP_MENOR}		{System.out.println("Token OP_MENOR encontrado, Lexema "+ yytext());}

{OP_MAYOR}		{System.out.println("Token OP_MAYOR encontrado, Lexema "+ yytext());}

{OP_MAYOR_IGUAL}		{System.out.println("Token OP_MAYOR_IGUAL encontrado, Lexema "+ yytext());}

{OP_MENOR_IGUAL}		{System.out.println("Token OP_MENOR_IGUAL encontrado, Lexema "+ yytext());}

{OP_DISTINTO}		{System.out.println("Token OP_DISTINTO, Lexema "+ yytext());} 

{OP_IGUAL}		    {System.out.println("Token OP_IGUAL, encontrado Lexema "+ yytext());} 

{OP_AND}		{System.out.println("Token OP_AND, encontrado Lexema "+ yytext());} 

{OP_OR}		    {System.out.println("Token OP_OR, encontrado Lexema "+ yytext()); }

{OP_NOT}		{System.out.println("Token OP_NOT, encontrado Lexema "+ yytext());}

// -------------------- Simbolos -------------------------

{PARENTESIS_ABRE}   {System.out.println("Token PARENTESIS_ABRE, encontrado Lexema "+ yytext()); }

{PARENTESIS_CIERRA}   {System.out.println("Token PARENTESIS_CIERRA, encontrado Lexema "+ yytext()); }

{LLAVE_ABRE}   {System.out.println("Token LLAVE_ABRE, encontrado Lexema "+ yytext()); }

{LLAVE_CIERRA}   {System.out.println("Token LLAVE_CIERRA, encontrado Lexema "+ yytext()); }

{CORCHETE_ABRE}   {System.out.println("Token CORCHETE_ABRE, encontrado Lexema "+ yytext()); }

{CORCHETE_CIERRA}   {System.out.println("Token CORCHETE_CIERRA, encontrado Lexema "+ yytext()); }

{PUNTO_COMA}   {System.out.println("Token PUNTO_COMA, encontrado Lexema "+ yytext()); }

{COMA}   {System.out.println("Token COMA, encontrado Lexema "+ yytext()); }

{PUNTO}   {System.out.println("Token PUNTO, encontrado Lexema "+ yytext()); }

{DOS_PUNTOS}   {System.out.println("Token DOS_PUNTOS, encontrado Lexema "+ yytext()); }

// -------------------- Ids y tabla -------------------------

{WRITE}   {System.out.println("Token WRITE, encontrado Lexema "+ yytext()); }

{ID}   {System.out.println("Token ID, encontrado Lexema "+ yytext()); }

{CONST_INT}   {System.out.println("Token CONST_INT, encontrado Lexema "+ yytext()); }

{CONST_STR}   {System.out.println("Token CONST_STR, encontrado Lexema "+ yytext()); }

{CONST_BIN}   {System.out.println("Token CONST_BIN, encontrado Lexema "+ yytext()); }

{CONST_HEX}   {System.out.println("Token CONST_HEX, encontrado Lexema "+ yytext()); }

{INTEGER}   {System.out.println("Token INTEGER, encontrado Lexema "+ yytext()); }

{STRING}   {System.out.println("Token STRING, encontrado Lexema "+ yytext()); }

{FLOAT}   {System.out.println("Token FLOAT, encontrado Lexema "+ yytext()); }

// -------------------- Palabras reservadas  -------------------------

{WHILE}   {System.out.println("Token WHILE, encontrado Lexema "+ yytext()); }

{DO}   {System.out.println("Token DO, encontrado Lexema "+ yytext()); }

{IF}   {System.out.println("Token IF, encontrado Lexema "+ yytext()); }

{THEN}   {System.out.println("Token THEN, encontrado Lexema "+ yytext()); }

{ELSE}   {System.out.println("Token ELSE, encontrado Lexema "+ yytext()); }

{WRITE}   {System.out.println("Token WRITE, encontrado Lexema "+ yytext()); }

{DECLARE}   {System.out.println("Token DECLARE, encontrado Lexema "+ yytext()); }

{ENDDECLARE}   {System.out.println("Token ENDDECLARE, encontrado Lexema "+ yytext()); }

{PROGRAM_SECTION}   {System.out.println("Token PROGRAM_SECTION, encontrado Lexema "+ yytext()); }

{ENDPROGRAM_SECTION}   {System.out.println("Token ENDPROGRAM_SECTION, encontrado Lexema "+ yytext()); }

{CONTAR_PRIMOS}   {System.out.println("Token CONTAR_PRIMOS, encontrado Lexema "+ yytext()); }

{ESPACIO}		      {/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}		{System.out.println("Token COMENTARIO encontrado, Lexema: "+ yytext());}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }





















