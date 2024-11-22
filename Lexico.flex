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

%{
    private ArrayList<String> lista = new ArrayList<>();
    private ArrayList<SymbolTableEntry> tsEntries = new ArrayList<>();
    
    public ArrayList getList() {
        return this.lista;
    }

    public void vaciarLista() {
        this.lista.clear();
    }

    public ArrayList<SymbolTableEntry> getTS(){
        return this.tsEntries;
    }

    public void agregarATablaDeSimbolos(String token, String valor) {
      boolean existe = false;
      for (SymbolTableEntry entrada : tsEntries) {
        if (entrada.getToken().equals(token) && ((entrada.getNombre().equals(valor)) || (entrada.getNombre().equals("_" + valor)))) {
          existe = true;
          }
      }

      if (!existe) tsEntries.add(new SymbolTableEntry(valor, token));
    }

%}

LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+

/*Comentarios*/

COMENTARIO = "//*" ~ "*//" // El ~ incluye cualquier caracter

//Operadores aritmeticos

OP_ASIGNACION = "::="
OP_DECLARACION = ":="
OP_SUMA = "+"
OP_RESTA = "-"
OP_DIVISION = "/"
OP_MULTIPLICACION = "*"

//Operadores logicos

OP_MENOR = "<"
OP_MAYOR = ">"
OP_MAYOR_IGUAL = ">="
OP_MENOR_IGUAL = "<="
OP_IGUAL = "=="
OP_DISTINTO = "!="
OP_AND = "AND" | "and"
OP_OR = "OR" | "or"
OP_NOT = "NOT" | "not"

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
IGUAL = "="

//Ids y tabla

WRITE = "WRITE"|"write"|"Write"
CONST_INTEGER = {DIGITO}+
CONST_DOU = ({DIGITO}* "." {DIGITO}+) | ({DIGITO}+ "." {DIGITO}*)
CONST_STR = "'" ({DIGITO}|{LETRA}|{ESPACIO})* "'"
CONST_BIN = ("0b") ("0"|"1")+
INTEGER = "INTEGER"|"integer"|"Integer"
STRING = "STRING"|"string"|"String"
FLOAT = "FLOAT"|"float"|"Float"

//Rangos maximos
//MAX_INTEGER = 65536
//MAX_REALES = 2147483647.0
//MAX_STRING = 30

//Palabras reservadas

WHILE = "WHILE" |"while"|"While"
IF = "IF" |"if"|"If"
THEN = "THEN"|"then"|"Then"
ELSE = "ELSE"|"else"|"Else"
ENDIF = "ENDIF"|"endif"|"EndIF"
WRITE = "WRITE"|"write"|"Write"
DECLARE = "DECLARE.SECTION"|"declare.section"
ENDDECLARE = "ENDDECLARE.SECTION"|"enddeclare.section"
PROGRAM = "PROGRAM.SECTION"|"program.section"
ENDPROGRAM = "ENDPROGRAM.SECTION"|"endprogram.section"
CONTAR_PRIMOS = "CONTARPRIMOS"|"contarprimos"|"ContarPrimos"|"contarPrimos"

ID = {LETRA} ({LETRA}|{DIGITO})*

%%

<YYINITIAL> {

// -------------------- Operadores aritmeticos-------------------------

{OP_ASIGNACION}		{
    lista.add("Token OP_ASIGNACION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_ASIGNACION encontrado, Lexema: "+ yytext());
    return new Symbol(sym.OP_ASIGNACION, yytext());
}

{OP_DECLARACION}		{
    lista.add("Token OP_DECLARACION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DECLARACION encontrado, Lexema: "+ yytext());
    return new Symbol(sym.OP_DECLARACION, yytext());
}

{OP_SUMA}		{
    lista.add("Token OP_SUMA, encontrado Lexema "+ yytext());
    System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_SUMA, yytext());
}

{OP_RESTA}		{
    lista.add("Token OP_RESTA, encontrado Lexema "+ yytext());
    System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_RESTA, yytext());
}

{OP_DIVISION}		{
    lista.add("Token OP_DIVISION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DIVISION encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_DIVISION, yytext());
}

{OP_MULTIPLICACION}		{
    lista.add("Token OP_MULTIPLICACION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MULTIPLICACION encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_MULTIPLICACION, yytext());
}

// -------------------- Operadores logicos -------------------------

{OP_MENOR}		{
    lista.add("Token OP_MENOR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MENOR encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_MENOR, yytext());
}

{OP_MAYOR}		{
    lista.add("Token OP_MAYOR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MAYOR encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_MAYOR, yytext());
}

{OP_MAYOR_IGUAL}		{
    lista.add("Token OP_MAYOR_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MAYOR_IGUAL encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_MAYOR_IGUAL, yytext());
}

{OP_MENOR_IGUAL}		{
    lista.add("Token OP_MENOR_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MENOR_IGUAL encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_MENOR_IGUAL, yytext());
}

{OP_DISTINTO}		{
    lista.add("Token OP_DISTINTO, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DISTINTO encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_DISTINTO, yytext());
}

{OP_IGUAL}		    {
    lista.add("Token OP_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_IGUAL encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_IGUAL, yytext());
}

{OP_AND}		{
    lista.add("Token OP_AND, encontrado Lexema "+ yytext());
    System.out.println("Token OP_AND encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_AND, yytext());
}

{OP_OR}		    {
    lista.add("Token OP_OR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_OR encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_OR, yytext());
}

{OP_NOT}		{
    lista.add("Token OP_NOT, encontrado Lexema "+ yytext());
    System.out.println("Token OP_NOT encontrado, Lexema "+ yytext());
    return new Symbol(sym.OP_NOT, yytext());
}

// -------------------- Simbolos -------------------------

{PARENTESIS_ABRE}   {
    lista.add("Token PARENTESIS_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token PARENTESIS_ABRE encontrado, Lexema "+ yytext());
    return new Symbol(sym.PARENTESIS_ABRE, yytext());
}

{PARENTESIS_CIERRA}   {
    lista.add("Token PARENTESIS_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token PARENTESIS_CIERRA encontrado, Lexema "+ yytext());
    return new Symbol(sym.PARENTESIS_CIERRA, yytext());
}

{LLAVE_ABRE}   {
    lista.add("Token LLAVE_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token LLAVE_ABRE encontrado, Lexema "+ yytext());
    return new Symbol(sym.LLAVE_ABRE, yytext());
}

{LLAVE_CIERRA}   {
    lista.add("Token LLAVE_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token LLAVE_CIERRA encontrado, Lexema "+ yytext());
    return new Symbol(sym.LLAVE_CIERRA, yytext());
}

{CORCHETE_ABRE}   {
    lista.add("Token CORCHETE_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token CORCHETE_ABRE encontrado, Lexema "+ yytext());
    return new Symbol(sym.CORCHETE_ABRE, yytext());
}

{CORCHETE_CIERRA}   {
    lista.add("Token CORCHETE_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token CORCHETE_CIERRA encontrado, Lexema "+ yytext());
    return new Symbol(sym.CORCHETE_CIERRA, yytext());
}

{PUNTO_COMA}   {
    lista.add("Token PUNTO_COMA, encontrado Lexema "+ yytext());
    System.out.println("Token PUNTO_COMA encontrado, Lexema "+ yytext());
    return new Symbol(sym.PUNTO_COMA, yytext());
}

{COMA}   {
    lista.add("Token COMA, encontrado Lexema "+ yytext());
    System.out.println("Token COMA encontrado, Lexema "+ yytext());
    return new Symbol(sym.COMA, yytext());
}

{PUNTO}   {
    lista.add("Token PUNTO, encontrado Lexema "+ yytext());
    System.out.println("Token PUNTO encontrado, Lexema "+ yytext());
    return new Symbol(sym.PUNTO, yytext());
}

{DOS_PUNTOS}   {
    lista.add("Token DOS_PUNTOS, encontrado Lexema "+ yytext());
    System.out.println("Token DOS_PUNTOS encontrado, Lexema "+ yytext());
    return new Symbol(sym.DOS_PUNTOS, yytext());
}

{IGUAL}   {
    lista.add("Token IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token IGUAL encontrado, Lexema "+ yytext());
    return new Symbol(sym.IGUAL, yytext());
}

// -------------------- Ids y tabla -------------------------

{WRITE}   {
    System.out.println("Token WRITE, encontrado Lexema "+ yytext());
    lista.add("Token WRITE, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.WRITE, yytext());
}


{CONST_INTEGER}   {
    System.out.println("Token CONST_INTEGER, encontrado Lexema "+ yytext());
    if((Integer.parseInt(yytext()) >= 0) && (Integer.parseInt(yytext()) <= 65536))
    {
        agregarATablaDeSimbolos("CONST_INTEGER", yytext());
        lista.add("Token CONST_INTEGER, encontrado Lexema "+ yytext());
        return new Symbol(sym.CONST_INTEGER, yytext());
    } else {
        throw new Exception("Constante integer fuera de rango: |" + yytext() + "|" );
    }
}

{CONST_STR}   {
    System.out.println("Token CONST_STR, encontrado Lexema "+ yytext());
    if(yytext().length() <= 30 )
    {
        agregarATablaDeSimbolos("CONST_STR", yytext());
        lista.add("Token CONST_STR, encontrado Lexema "+ yytext());
        return new Symbol(sym.CONST_STR, yytext());
    } else {
        throw new Exception("Constante string fuera de rango: |" + yytext() + "|" );
    }
}

{CONST_DOU}   {
    System.out.println("Token CONST_DOU, encontrado Lexema "+ yytext()); 
    if((Double.parseDouble(yytext()) >= 0) && (Double.parseDouble(yytext()) <= 2147483647.0))
    {
        agregarATablaDeSimbolos("CONST_DOU", yytext());
        lista.add("Token CONST_DOU, encontrado Lexema "+ yytext());
        return new Symbol(sym.CONST_DOU, yytext());
    } else {
        throw new Exception("Constante real fuera de rango: |" + yytext() + "|" );
    }
}

{CONST_BIN}  {
    System.out.println("Token CONST_BIN, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_BIN", yytext());
    lista.add("Token CONST_BIN, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.CONST_BIN, yytext());
}

{INTEGER}   {
    System.out.println("Token INTEGER, encontrado Lexema "+ yytext()); 
    lista.add("Token INTEGER, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.INTEGER, yytext());
}

{STRING}   {
    System.out.println("Token STRING, encontrado Lexema "+ yytext());
    lista.add("Token STRING, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.STRING, yytext());
}

{FLOAT}   {
    System.out.println("Token FLOAT, encontrado Lexema "+ yytext()); 
    lista.add("Token FLOAT, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.FLOAT, yytext());
}

// -------------------- Palabras reservadas  -------------------------

{WHILE}   {
    System.out.println("Token WHILE, encontrado Lexema "+ yytext());
    lista.add("Token WHILE, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.WHILE, yytext());
}

{IF}   {
    System.out.println("Token IF, encontrado Lexema "+ yytext());
    lista.add("Token IF, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.IF, yytext());
}

{THEN}   {
    System.out.println("Token THEN, encontrado Lexema "+ yytext());
    lista.add("Token THEN, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.THEN, yytext());
}

{ELSE}   {
    System.out.println("Token ELSE, encontrado Lexema "+ yytext());
    lista.add("Token ELSE, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.ELSE, yytext());
}

{ENDIF}   {
    System.out.println("Token ENDIF, encontrado Lexema "+ yytext());
    lista.add("Token ENDIF, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.ENDIF, yytext());
}

{WRITE}   {
    System.out.println("Token WRITE, encontrado Lexema "+ yytext());
    lista.add("Token WRITE, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.WRITE, yytext());
}

{DECLARE}  {
    System.out.println("Token DECLARE, encontrado Lexema "+ yytext());
    lista.add("Token DECLARE, encontrado Lexema "+ yytext());
    return new Symbol(sym.DECLARE, yytext());
}

{ENDDECLARE}   {
    System.out.println("Token ENDDECLARE, encontrado Lexema "+ yytext());
    lista.add("Token ENDDECLARE, encontrado Lexema "+ yytext()); 
    return new Symbol(sym.ENDDECLARE, yytext());
}

{PROGRAM}   {
    System.out.println("Token PROGRAM_SECTION, encontrado Lexema "+ yytext());
    lista.add("Token PROGRAM_SECTION, encontrado Lexema "+ yytext());
    return new Symbol(sym.PROGRAM, yytext());
}

{ENDPROGRAM}   {
    System.out.println("Token ENDPROGRAM_SECTION, encontrado Lexema "+ yytext());
    lista.add("Token ENDPROGRAM_SECTION, encontrado Lexema "+ yytext());
    return new Symbol(sym.ENDPROGRAM, yytext());
}

{CONTAR_PRIMOS}   {
    System.out.println("Token CONTAR_PRIMOS, encontrado Lexema "+ yytext());
    lista.add("Token CONTAR_PRIMOS, encontrado Lexema "+ yytext());
    return new Symbol(sym.CONTAR_PRIMOS, yytext());
}

{ID}   {
    lista.add("Token ID, encontrado Lexema "+ yytext());
    System.out.println("Token ID, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("ID", yytext());
    return new Symbol(sym.ID, yytext());
}

{ESPACIO}		      {/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}		      {/* no se realiza accion por lo tanto se ignoran*/}

}

[^]		{ throw new Exception("Caracter no permitido: <" + yytext() + "> en la linea"); }





















