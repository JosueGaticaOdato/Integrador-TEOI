package ejemploflex;
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



//Comentarios 

COMMENT = "/*" ~ "*/"
INLINE_COMENT = "//" ~

//Operadores aritmeticos
OP_ASIGN = "="
OP_SUMA = "+"
OP_RESTA = "-"
OP_DIV = "/"
OP_MULT = "*"
OP_MOD = "%"
OP_POT = "^"

//Operadores logicos
OP_MEN = "<"
OP_MAY = ">"
OP_MAY_IG = ">="
OP_MEN_IG = "<="
OP_IG = "=="
OP_DIST = "!="
OP_AND = "AND"
OP_OR = "OR"
OP_NOT = "NOT"

//Simbolos
PAREN_ABRE = "("
PAREN_CIERRA = ")"
BLOCK_ABRE = "{"
BLOCK_CIERRA = "}"
BRACK_ABRE = "["
BRACK_CIERRA = "]"
PUNTO_COMA = ";"
COMA = ","
PUNTO = "."
DOS_PUNTOS = ":"

//Ids y tabla
WRITE = "WRITE"
ID = {LETRA} ({LETRA}|{DIGITO})*
CONST_INT = {DIGITO}+
CONST_STR = "“" ({LETRA}|{DIGITO}|_)* "”" 
CONST_BIN = "(" ("0"|"1")+  "," "2" ")"
CONST_HEX = "("  ({DIGITO} | "A" | "B" | "C" | "D" | "E" | "F")+  "," "16"  ")"
INTEGER = "INTEGER"
STRING = "STRING"
FLOAT = "FLOAT"

//Palabras reservadas
WHILE = "WHILE"
DO = "DO"
IF = "IF"
THEN = "THEN"
ELSE = "ELSE"
WRITE = "WRITE"
DECLARE = "DECLARE"
ENDDECLARE = "ENDDECLARE"
PROGRAM_SECTION = "PROGRAMSECTION"
ENDPROGRAM_SECTION "ENDPROGRAMSECTION"
CONTAR_PRIMOS = "CONTARPRIMOS"



%%

<YYINITIAL> {


":="			{System.out.println("Token ASIGN encontrado, Lexema "+ yytext());}

"FOR"			{System.out.println("Token PRFOR encontrado, Lexema "+ yytext());}

"INT"			{System.out.println("Token PRINT encontrado, Lexema "+ yytext());}

"("				{System.out.println("Token PARA encontrado, Lexema "+ yytext());}

")"				{System.out.println("Token PARC encontrado, Lexema "+ yytext());}

"{"				{System.out.println("Token LLAVEA encontrado, Lexema "+ yytext());}

"}"				{System.out.println("Token LLAVEC encontrado, Lexema "+ yytext());}

"="				{System.out.println("Token IGUAL encontrado, Lexema "+ yytext());}

"<="			{System.out.println("Token MENIGUAL encontrado, Lexema "+ yytext());}

";"				{System.out.println("Token PUNYCOM encontrado, Lexema "+ yytext());}

"+="			{System.out.println("Token MASIGUAL encontrado, Lexema "+ yytext());}

{ID}			{System.out.println("Token ID encontrado, Lexema "+ yytext()); /* recordar colocarlo luego de las palabras reservadas porque si se coloca antes va a reconocer la palabra como ID */ }

{CONST_INT}		{System.out.println("Token CONST_INT, encontrado Lexema "+ yytext()); /* recordar que no debe exceder los 16 bits 0 < entero < 32768 */}

{ESPACIO}		{/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}	{/* No se realiza accion por lo tanto se ignoran*/}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }





















