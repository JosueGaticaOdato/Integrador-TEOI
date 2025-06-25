package nodos;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import app.SymbolTableEntry;

public class NodoCiclo extends NodoSentencia {
    private final NodoExpresionBooleana condicion;
    private final List<NodoSentencia> cuerpo;
  

    public NodoCiclo(NodoExpresionBooleana condicion, List<NodoSentencia> cuerpo) {
        super("WHILE");
        this.condicion = condicion;
        this.cuerpo = cuerpo;
       
    }

    @Override
    protected String graficar(String idPadre) {
        final String miId = this.getIdNodo();
        StringBuilder resultado = new StringBuilder();

        // Grafica el nodo IF
        resultado.append(super.graficar(idPadre));

        // Grafica la condición colgando directamente del nodo CUERPO
        resultado.append(condicion.graficar(miId));

        // Agrega un nodo ficticio CUERPO colgando del nodo WHILE
        Nodo nodoThen = new Nodo("Cuerpo");
        resultado.append(nodoThen.graficar(miId));

        // Grafica las sentencias asociadas al "then" colgando del nodo ficticio THEN
        String idNodoThen = nodoThen.getIdNodo();
        for (NodoSentencia sentencia: cuerpo) {
            resultado.append(sentencia.graficar(idNodoThen));
        }

        /* Si hay sentencias asociadas al "else"...
        if (sentenciasElse != null) {
            // Agrega un nodo ficticio "ELSE" colgando del nodo IF
            Nodo nodoElse = new Nodo("Else");
            resultado.append(nodoElse.graficar(miId));

            // Grafica las sentencias asociadas al "else" colgando del nodo ficticio ELSE
            String idNodoElse = nodoElse.getIdNodo();
            for (NodoSentencia sentencia: sentenciasElse) {
                resultado.append(sentencia.graficar(idNodoElse));
            }
        }
*/
        return resultado.toString();
    }
    
    @Override
    public String assemble(StringBuilder asm, HashMap<String, SymbolTableEntry> symbolTable,
        AtomicInteger auxCount) {
        int i = auxCount.getAndIncrement();
        asm.append("\n");
        asm.append("inicio_while").append(i).append(":");
        this.condicion.assemble(asm, auxCount, Boolean.TRUE, "end_while" + i, "sentencias_while" + i, symbolTable);
        asm.append("\n");
        asm.append("sentencias_while").append(i).append(":").append("\n");
        for (NodoSentencia nodoSentencia : this.cuerpo) {
            nodoSentencia.assemble(asm, symbolTable, auxCount);
        }
        asm.append("JMP inicio_while").append(i).append("\n")
           .append("end_while").append(i).append(":").append("\n");
        return "";
    }
}


