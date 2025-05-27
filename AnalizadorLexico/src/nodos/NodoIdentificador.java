package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoIdentificador extends NodoExpresion {
    private final String identificador;

    public NodoIdentificador(String identificador) {
        super("ID");
        this.identificador = identificador;
    }

    @Override
    public String getDescripcionNodo() {
        return "ID: " + identificador;
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
        return identificador;
    }
}
