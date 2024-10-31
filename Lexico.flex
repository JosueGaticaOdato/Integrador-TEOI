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
    private PrintWriter writer = null;

    public Lexico(java.io.Reader in, String filePath) {
        this.zzReader = in;
        try {
            File file = new File(filePath);
            file.createNewFile();
            writer = new PrintWriter(new FileWriter(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList getList() {
        return this.lista;
    }

    public void vaciarLista() {
        this.lista.clear();
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

%eof{
    if (writer != null) {
    	String header = String.format("%-25s | %-15s | %-10s | %-25s |%-5s", "NOMBRE", "TOKEN", "TIPO", "VALOR", "LONGITUD");
    	writer.println(header);
    	for(SymbolTableEntry entryInstance: tsEntries) {
    		String entry = entryInstance.getEntry();
    		writer.println(entry);
    	}
        
        writer.close();
    }
%eof}

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
OP_MODULO = "%"
OP_POTENCIA = "^"

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

//Ids y tabla

WRITE = "WRITE"|"write"|"Write"
CONST_INTEGER = {DIGITO}+
CONST_DOU = ({DIGITO}* "." {DIGITO}+) | ({DIGITO}+ "." {DIGITO}*)
CONST_STR = "'" ({DIGITO}|{LETRA}|{ESPACIO})* "'" 
CONST_BIN = "(" {ESPACIO}* ("0"|"1")+ {ESPACIO}* "," {ESPACIO}* "2" {ESPACIO}* ")"

INTEGER = "INTEGER"|"integer"|"Integer"
STRING = "STRING"|"string"|"String"
FLOAT = "FLOAT"|"float"|"Float"

//Rangos maximos
//MAX_INTEGER = 65536
//MAX_REALES = 2147483647.0
//MAX_STRING = 30

//Palabras reservadas

WHILE = "WHILE" |"while"|"While"
DO = "DO" |"do"|"Do"
IF = "IF" |"if"|"If"
THEN = "THEN"|"then"|"Then"
ELSE = "ELSE"|"else"|"Else"
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
}

{OP_DECLARACION}		{
    lista.add("Token OP_DECLARACION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DECLARACION encontrado, Lexema: "+ yytext());
}

{OP_SUMA}		{
    lista.add("Token OP_SUMA, encontrado Lexema "+ yytext());
    System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());
}

{OP_RESTA}		{
    lista.add("Token OP_RESTA, encontrado Lexema "+ yytext());
    System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());
}

{OP_DIVISION}		{
    lista.add("Token OP_DIVISION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DIVISION encontrado, Lexema "+ yytext());
}

{OP_MULTIPLICACION}		{
    lista.add("Token OP_MULTIPLICACION, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MULTIPLICACION encontrado, Lexema "+ yytext());
}

{OP_MODULO}		{
    lista.add("Token OP_MODULO, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MODULO encontrado, Lexema "+ yytext());
}

{OP_POTENCIA}		{
    lista.add("Token OP_POTENCIA, encontrado Lexema "+ yytext());
    System.out.println("Token OP_POTENCIA encontrado, Lexema "+ yytext());
}

// -------------------- Operadores logicos -------------------------

{OP_MENOR}		{
    lista.add("Token OP_MENOR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MENOR encontrado, Lexema "+ yytext());
}

{OP_MAYOR}		{
    lista.add("Token OP_MAYOR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MAYOR encontrado, Lexema "+ yytext());
}

{OP_MAYOR_IGUAL}		{
    lista.add("Token OP_MAYOR_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MAYOR_IGUAL encontrado, Lexema "+ yytext());
}

{OP_MENOR_IGUAL}		{
    lista.add("Token OP_MENOR_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_MENOR_IGUAL encontrado, Lexema "+ yytext());
}

{OP_DISTINTO}		{
    lista.add("Token OP_DISTINTO, encontrado Lexema "+ yytext());
    System.out.println("Token OP_DISTINTO encontrado, Lexema "+ yytext());
}

{OP_IGUAL}		    {
    lista.add("Token OP_IGUAL, encontrado Lexema "+ yytext());
    System.out.println("Token OP_IGUAL encontrado, Lexema "+ yytext());
}

{OP_AND}		{
    lista.add("Token OP_AND, encontrado Lexema "+ yytext());
    System.out.println("Token OP_AND encontrado, Lexema "+ yytext());
}

{OP_OR}		    {
    lista.add("Token OP_OR, encontrado Lexema "+ yytext());
    System.out.println("Token OP_OR encontrado, Lexema "+ yytext());
}

{OP_NOT}		{
    lista.add("Token OP_NOT, encontrado Lexema "+ yytext());
    System.out.println("Token OP_NOT encontrado, Lexema "+ yytext());
}

// -------------------- Simbolos -------------------------

{PARENTESIS_ABRE}   {
    lista.add("Token PARENTESIS_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token PARENTESIS_ABRE encontrado, Lexema "+ yytext());
}

{PARENTESIS_CIERRA}   {
    lista.add("Token PARENTESIS_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token PARENTESIS_CIERRA encontrado, Lexema "+ yytext());
}

{LLAVE_ABRE}   {
    lista.add("Token LLAVE_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token LLAVE_ABRE encontrado, Lexema "+ yytext());
}

{LLAVE_CIERRA}   {
    lista.add("Token LLAVE_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token LLAVE_CIERRA encontrado, Lexema "+ yytext());
}

{CORCHETE_ABRE}   {
    lista.add("Token CORCHETE_ABRE, encontrado Lexema "+ yytext());
    System.out.println("Token CORCHETE_ABRE encontrado, Lexema "+ yytext());
}

{CORCHETE_CIERRA}   {
    lista.add("Token CORCHETE_CIERRA, encontrado Lexema "+ yytext());
    System.out.println("Token CORCHETE_CIERRA encontrado, Lexema "+ yytext());
}

{PUNTO_COMA}   {
    lista.add("Token PUNTO_COMA, encontrado Lexema "+ yytext());
    System.out.println("Token PUNTO_COMA encontrado, Lexema "+ yytext());
}

{COMA}   {
    lista.add("Token COMA, encontrado Lexema "+ yytext());
    System.out.println("Token COMA encontrado, Lexema "+ yytext());
}

{PUNTO}   {
    lista.add("Token PUNTO, encontrado Lexema "+ yytext());
    System.out.println("Token PUNTO encontrado, Lexema "+ yytext());
}

{DOS_PUNTOS}   {
    lista.add("Token DOS_PUNTOS, encontrado Lexema "+ yytext());
    System.out.println("Token DOS_PUNTOS encontrado, Lexema "+ yytext());
}

// -------------------- Ids y tabla -------------------------

{WRITE}   {
    System.out.println("Token WRITE, encontrado Lexema "+ yytext());
    lista.add("Token WRITE, encontrado Lexema "+ yytext()); 
}


{CONST_INTEGER}   {
    System.out.println("Token CONST_INTEGER, encontrado Lexema "+ yytext());
    if((Integer.parseInt(yytext()) >= 0) && (Integer.parseInt(yytext()) <= 65536))
    {
        agregarATablaDeSimbolos("CONST_INTEGER", yytext());
        lista.add("Token CONST_INTEGER, encontrado Lexema "+ yytext());
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
    } else {
        throw new Exception("Constante real fuera de rango: |" + yytext() + "|" );
    }
}

{CONST_BIN}  {
    System.out.println("Token CONST_BIN, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_BIN", yytext());
    lista.add("Token CONST_BIN, encontrado Lexema "+ yytext()); 
}

{INTEGER}   {
    System.out.println("Token INTEGER, encontrado Lexema "+ yytext()); 
    lista.add("Token INTEGER, encontrado Lexema "+ yytext()); 
}

{STRING}   {
    System.out.println("Token STRING, encontrado Lexema "+ yytext());
    lista.add("Token STRING, encontrado Lexema "+ yytext()); 
}

{FLOAT}   {
    System.out.println("Token FLOAT, encontrado Lexema "+ yytext()); 
    lista.add("Token FLOAT, encontrado Lexema "+ yytext()); 
}

// -------------------- Palabras reservadas  -------------------------

{WHILE}   {
    System.out.println("Token WHILE, encontrado Lexema "+ yytext());
    lista.add("Token WHILE, encontrado Lexema "+ yytext()); 
}

{DO}   {
    System.out.println("Token DO, encontrado Lexema "+ yytext());
    lista.add("Token DO, encontrado Lexema "+ yytext()); 
}

{IF}   {
    System.out.println("Token IF, encontrado Lexema "+ yytext());
    lista.add("Token IF, encontrado Lexema "+ yytext()); 
}

{THEN}   {
    System.out.println("Token THEN, encontrado Lexema "+ yytext());
    lista.add("Token THEN, encontrado Lexema "+ yytext()); 
}

{ELSE}   {
    System.out.println("Token ELSE, encontrado Lexema "+ yytext());
    lista.add("Token ELSE, encontrado Lexema "+ yytext()); 
}

{WRITE}   {
    System.out.println("Token WRITE, encontrado Lexema "+ yytext());
    lista.add("Token WRITE, encontrado Lexema "+ yytext()); 
}

{DECLARE}  {
    System.out.println("Token DECLARE, encontrado Lexema "+ yytext());
    lista.add("Token DECLARE, encontrado Lexema "+ yytext()); 
}

{ENDDECLARE}   {
    System.out.println("Token ENDDECLARE, encontrado Lexema "+ yytext());
    lista.add("Token ENDDECLARE, encontrado Lexema "+ yytext()); 
}

{PROGRAM}   {
    System.out.println("Token PROGRAM_SECTION, encontrado Lexema "+ yytext());
    lista.add("Token PROGRAM_SECTION, encontrado Lexema "+ yytext());
}

{ENDPROGRAM}   {
    System.out.println("Token ENDPROGRAM_SECTION, encontrado Lexema "+ yytext());
    lista.add("Token ENDPROGRAM_SECTION, encontrado Lexema "+ yytext());
}

{CONTAR_PRIMOS}   {
    System.out.println("Token CONTAR_PRIMOS, encontrado Lexema "+ yytext());
    lista.add("Token CONTAR_PRIMOS, encontrado Lexema "+ yytext());
}

{ID}   {
    lista.add("Token ID, encontrado Lexema "+ yytext());
    System.out.println("Token ID, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("ID", yytext());
}

{ESPACIO}		      {/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}		      {/* no se realiza accion por lo tanto se ignoran*/}

//{COMENTARIO}		{
//    System.out.println("Token COMENTARIO, encontrado Lexema "+ yytext());
//    lista.add("Token COMENTARIO, encontrado Lexema "+ yytext());
//}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }





















