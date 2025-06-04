package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoConstanteFloat extends NodoExpresion {
    private final float valor;

    public NodoConstanteFloat(Number valor) {
        super("CTE");
        this.valor = valor.floatValue();
    }

    @Override
    public String getDescripcionNodo() {
        return "CTE: " + valor;
    }
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return "_" + String.valueOf(valor).replace(".", "_point_");
    }
}