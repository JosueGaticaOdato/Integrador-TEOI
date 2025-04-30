package nodos;

import java.util.List;

public class NodoContarPrimos extends Nodo {
    private List<Nodo> parametros;

    public NodoContarPrimos(List<Nodo> parametros) {
        super("contarprimos");
        this.parametros = parametros;
    }

    public List<Nodo> getParametros() {
        return parametros;
    }

    @Override
    protected String graficar(String idPadre) {
        StringBuilder sb = new StringBuilder();
        String idActual = getIdNodo();
        sb.append(String.format("%s [label=\"%s\"]\n", idActual, getDescripcionNodo()));
        sb.append(String.format("%s -- %s\n", idPadre, idActual));
        
        for (Nodo p : parametros) {
            sb.append(p.graficar(idActual));
        }
        return sb.toString();
    }
}
