package nodos;

import java.util.concurrent.atomic.AtomicInteger;

public class NodoComparacion extends NodoExpresionBooleana {
private final NodoExpresion  izquierda;
private final NodoExpresion  derecha;

    public NodoComparacion (String nombre,NodoExpresion izquierda, NodoExpresion derecha) {
        super(nombre);
        this.izquierda = izquierda;
        this.derecha = derecha;

    }
    
    public NodoExpresion getIzquierda() {
        return izquierda;
    }
    public NodoExpresion getDerecha() {
        return derecha;
    }
    
     @Override
    protected String graficar(String idPadre) {
        final String miId = this.getIdNodo();
        return super.graficar(idPadre) +
                izquierda.graficar(miId) +
                derecha.graficar(miId);
    }
     
     @Override
     protected String assemble(StringBuilder asm, AtomicInteger auxCount, Boolean inverse, String jumpToLeft, String jumpToRight) {
		return null;
	}
    
}
