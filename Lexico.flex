@@ -0,0 +1,86 @@
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
ID = {LETRA} ({LETRA}|{DIGITO}|_)*
CONST_INT = {DIGITO}+
COMENTARIO = "</" ~ "</" ~ "/>" ~ "/>" | "</" ~ "/>"
COMENT_JAVA = "/*" ~ "*/" // El simbolo ~ incluye cualquier caracter


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





















