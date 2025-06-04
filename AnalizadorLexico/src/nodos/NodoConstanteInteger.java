package nodos;

import java.util.concurrent.atomic.AtomicInteger;

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
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return "_" + valor;
    }
    
    @Override
    public NodoExpresion clonar() {
        return new NodoConstanteInteger(this.valor);
    }
}
