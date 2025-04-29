package nodos;

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
}
