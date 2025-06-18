package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoConstanteString extends NodoExpresion {
    private final String valor;

    public NodoConstanteString(String valor) {
        super("CTE");
        this.valor = valor;
    }

    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return "_" + valor.replace(" ", "_").replace(".", "_point_")
            .replaceAll("[¡!¿?]", "_");
    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
        return "_" + valor.replace(" ", "_").replace(".", "_point_")
            .replaceAll("[¡!¿?]", "_");
    }

    @Override
    public String getDescripcionNodo() {
        //return "CTE: " + valor;
        return valor;
    }
    
    @Override
    public String getValor() {
    	return valor.replace("'", "");
    }
}
