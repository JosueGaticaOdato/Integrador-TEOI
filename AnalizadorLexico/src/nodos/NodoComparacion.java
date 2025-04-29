package nodos;


public class NodoComparacion extends NodoExpresionBooleana {
private final NodoExpresion  izquierda;
private final NodoExpresion  derecha;

    public NodoComparacion (String nombre,NodoExpresion izquierda, NodoExpresion derecha) {
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
    
}
