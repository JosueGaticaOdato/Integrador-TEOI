package nodos;

import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoConstanteInteger extends NodoExpresion {
    private final int valor;

    public NodoConstanteInteger(int valor) {
        super("CTE");
        this.valor = valor;
    }

    @Override
    public String getDescripcionNodo() {
        return "CTE: " + Integer.toString(valor);
    }

    @Override
    public String getValor() {
        return String.valueOf(valor);
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return "_" + valor;
    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable, AtomicInteger auxCount) {
        return "_" + valor;
    }
    
    @Override
    public NodoExpresion clonar() {
        return new NodoConstanteInteger(this.valor);
    }
}
