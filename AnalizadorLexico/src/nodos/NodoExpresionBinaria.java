package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoExpresionBinaria extends NodoExpresion {
    protected final NodoExpresion izquierda;
    protected final NodoExpresion derecha;

    public NodoExpresionBinaria(String nombre, NodoExpresion izquierda, NodoExpresion derecha) {
        super(nombre);
        this.izquierda = izquierda;
        this.derecha = derecha;
    }

    @Override
    protected String graficar(String idPadre) {
        final String miId = this.getIdNodo();
        return super.graficar(idPadre) +
                izquierda.graficar(miId) +
                derecha.graficar(miId);
    }
    
    public NodoExpresion getIzquierda() {
        return izquierda;
    }

    public NodoExpresion getDerecha() {
        return derecha;
    }

    @Override
    public String assemble(StringBuilder asm, AtomicInteger auxCount) {
		return null;
	}
    
    @Override
    public NodoExpresion clonar() {
        return new NodoSuma(izquierda.clonar(), derecha.clonar());
    }
}