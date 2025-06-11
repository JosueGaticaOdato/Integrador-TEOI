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
    public String getValor() {
        return this.identificador; // o como estés guardando el id
    }
    
    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
    	return identificador;
    }
    
    @Override
    public NodoExpresion clonar() {
        return new NodoIdentificador(this.identificador);
    }
}
