package nodos;

import java.util.List;

public class NodoContarPrimos extends NodoExpresion {
    private List<NodoSentencia> instrucciones;
    private NodoIdentificador resultado;

    public NodoContarPrimos(List<NodoSentencia> instrucciones, NodoIdentificador resultado) {
    	super("CONTARPRIMOS");
    	this.instrucciones = instrucciones;
        this.resultado = resultado;
    }

    // método para graficar (puede recorrer las instrucciones)
    @Override
    public String graficar(String idPadre) {
        StringBuilder sb = new StringBuilder();
        String id = getIdNodo();
        sb.append(String.format("%s [label=\"ContarPrimos\"]\n", id));
        sb.append(String.format("%s -- %s\n", idPadre, id));
        for (NodoSentencia ins : instrucciones) {
            sb.append(ins.graficar(id));
        }
        return sb.toString();
    }

    // getter para el resultado (el valor final de k)
    public NodoIdentificador getResultado() {
        return resultado;
    }

    // más métodos si necesitás
}