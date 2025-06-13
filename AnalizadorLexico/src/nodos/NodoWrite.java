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

    /*@Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable,
        AtomicInteger auxCount) {
        String assembled = valor.getValor();
        //System.out.println("_" + assembled);
        SymbolTableEntry symbolTableEntry = symbolTable.get("_" + assembled);
        String sanitized = assembled.replaceAll("[^a-zA-Z0-9_]", "_");
        asm.append("\n");
        if (symbolTableEntry.getToken().equals("CONST_STR")) {
            asm.append("displayString ").append("_" + sanitized);
        }
        else {
            asm.append("displayFloat ").append(assembled).append(", 2");
        }
        asm.append("\n")
            .append("newLine")
            .append("\n");
        return "";
    }*/
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable,
        AtomicInteger auxCount) {

        asm.append("\n");

        if (valor instanceof NodoConstanteString) {
            String assembled = valor.getValor();
            String sanitized = assembled.replaceAll("[^a-zA-Z0-9_]", "_");
            asm.append("displayString ").append("_").append(sanitized).append("\n");
        } else if (valor instanceof NodoConstanteInteger) {
            String assembled = valor.getValor();
            asm.append("displayFloat ").append("_").append(assembled).append(", 2\n");
        } else if (valor instanceof NodoIdentificador) {
            String assembled = valor.getValor();
            SymbolTableEntry symbol = symbolTable.get(assembled);
            System.out.println(symbol);
            if (symbol.getTipo().equals("STRING")) {
            	asm.append("displayString ").append(assembled).append("\n");
            } 
            else if (symbol.getTipo().equals("INTEGER")) {
                // por si es temporal o una var auxiliar generada
                asm.append("displayInteger ").append(assembled).append("\n");
            } else {
                // por si es temporal o una var auxiliar generada
                asm.append("displayFloat ").append(assembled).append(", 2\n");
            }
        }

        asm.append("newLine\n");
        return "";
    }

    
}