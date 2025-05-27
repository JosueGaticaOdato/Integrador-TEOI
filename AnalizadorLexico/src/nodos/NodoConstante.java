package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoConstante extends NodoExpresion {
    private final int valor;

    public NodoConstante(int valor) {
        super("CTE");
        this.valor = valor;
    }

    @Override
    public String getDescripcionNodo() {
        return "CTE: " + Integer.toString(valor);
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return "_" + valor;
    }
}
