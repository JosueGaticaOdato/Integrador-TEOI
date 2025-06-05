package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoWrite extends NodoSentencia {
    private final NodoExpresion valor;

    public NodoWrite(NodoExpresion valor) {
        super("WRITE");
        this.valor = valor;
    }

    @Override
    protected String graficar(String idPadre) {
        final String miId = this.getIdNodo();
        return super.graficar(idPadre) +
            valor.graficar(miId);
    }

    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable,
        AtomicInteger auxCount) {
        String assembled = valor.getValor();
        //System.out.println("_" + assembled);
        SymbolTableEntry symbolTableEntry = symbolTable.get("_" + assembled);
        asm.append("\n");
        if (symbolTableEntry.getToken().equals("CONST_STR")) {
            asm.append("displayString ").append("_" + assembled);
        }
        else {
            asm.append("displayFloat ").append(assembled).append(", 2");
        }
        asm.append("\n")
            .append("newLine")
            .append("\n");
        return "";
    }

	/*@Override
	public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable,
			AtomicInteger auxCount) {

	    if (valor instanceof NodoConstanteString) {
	    	NodoConstanteString nodoStr = (NodoConstanteString) valor;
	        String texto = nodoStr.getDescripcionNodo(); // "hola", por ejemplo
	
	        // Quitar comillas si las tiene
	        if (texto.startsWith("\"") && texto.endsWith("\"")) {
	            texto = texto.substring(1, texto.length() - 1);
	        }

	        String nombreStr = "_msg" + auxCount.getAndIncrement();

	        // Definir el string en .DATA (sin comillas adicionales)
	        asm.insert(0, nombreStr + " db " + "\"" + texto + "\", 0\n");

	        // Imprimir
	        asm.append("displayString ").append(nombreStr).append("\n");
	        asm.append("newLine\n");

	        return "";
	    }

	    // Otro tipo de expresión
	    String assembled = valor.assemble(asm, auxCount);
	    asm.append("displayFloat ").append(assembled).append(", 2\n");
	    asm.append("newLine\n");

	    return "";
    }*/

    
    
}